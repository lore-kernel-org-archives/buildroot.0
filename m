From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 8 Apr 2020 22:40:25 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/python-flask: fix runtime
 python modules dependencies
In-Reply-To: <87h7xvp760.fsf@dell.be.48ers.dk>
References: <20200322211002.30765-1-ps.report@gmx.net>
 <20200322211002.30765-2-ps.report@gmx.net>
 <87h7xvp760.fsf@dell.be.48ers.dk>
Message-ID: <20200408224025.088155ab@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, 07 Apr 2020 18:55:19 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
>
>  > - add python setuptools runtime dependency, fixes:
>  >   ModuleNotFoundError: No module named 'pkg_resources'
>
> Hmm, the only instance of pkg_resources I see is in src/flask/cli.py:
>
>     def _load_plugin_commands(self):
>         if self._loaded_plugin_commands:
>             return
>         try:
>             import pkg_resources
>         except ImportError:
>             self._loaded_plugin_commands = True
>             return
>
>         for ep in pkg_resources.iter_entry_points("flask.commands"):
>             self.add_command(ep.load(), ep.name)
>         self._loaded_plugin_commands = True
>
> Which seems to nicely deal with missing pkg_resources.

Did re-run my flask test (reverted this patch) and try to run a simple hello
world example (from [1]):

        $ cat hello.py
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

        $ env FLASK_APP=hello.py flask run --host=0.0.0.0
Traceback (most recent call last):
  File "/usr/bin/flask", line 6, in <module>
    from pkg_resources import load_entry_point
ModuleNotFoundError: No module named 'pkg_resources'

>
>
>  > - add python libxml2 runtime dependency, fixes:
>  >   ModuleNotFoundError: No module named 'xml'
>
> The python-lxml package provides a 'lxml' module, NOT a 'xml' one. I
> don't see an 'import xml' line anywhere, where did you see that error?
>
>
>  > - add python ssl runtime dependency, fixes:
>  >   AttributeError: 'NoneType' object has no attribute 'SSLContext'
>
> This again seems to only be referenced in src/flask/cli.py if you pass a
> --key option. Presumably it works without SSL if you don't use --key
> / --cert on flask run?
>

Now re-added 'select BR2_PACKAGE_PYTHON_SETUPTOOLS':

	$ diff -u .config.old .config
--- .config.old 2020-04-07 23:28:50.829044089 +0200
+++ .config     2020-04-08 19:49:46.487754298 +0200
@@ -1206,7 +1206,7 @@
 # BR2_PACKAGE_PYTHON3_SSL is not set
 BR2_PACKAGE_PYTHON3_UNICODEDATA=y
 # BR2_PACKAGE_PYTHON3_SQLITE is not set
-# BR2_PACKAGE_PYTHON3_PYEXPAT is not set
+BR2_PACKAGE_PYTHON3_PYEXPAT=y
 # BR2_PACKAGE_PYTHON3_XZ is not set
 BR2_PACKAGE_PYTHON3_ZLIB=y

@@ -1480,7 +1480,7 @@
 # BR2_PACKAGE_PYTHON_SERIAL_ASYNCIO is not set
 # BR2_PACKAGE_PYTHON_SERVICE_IDENTITY is not set
 # BR2_PACKAGE_PYTHON_SETPROCTITLE is not set
-# BR2_PACKAGE_PYTHON_SETUPTOOLS is not set
+BR2_PACKAGE_PYTHON_SETUPTOOLS=y
 # BR2_PACKAGE_PYTHON_SH is not set
 # BR2_PACKAGE_PYTHON_SHUTILWHICH is not set
 # BR2_PACKAGE_PYTHON_SIMPLEAUDIO is not set
@@ -1947,7 +1947,7 @@
 #
 # BR2_PACKAGE_BENEJSON is not set
 # BR2_PACKAGE_CJSON is not set
-# BR2_PACKAGE_EXPAT is not set
+BR2_PACKAGE_EXPAT=y
 # BR2_PACKAGE_EZXML is not set
 # BR2_PACKAGE_JANSSON is not set
 # BR2_PACKAGE_JOSE is not set

	$ $ env FLASK_APP=hello.py flask run --host=0.0.0.0
[   22.431766] random: flask: uninitialized urandom read (24 bytes read)
[   22.443232] random: crng init done
Traceback (most recent call last):
  File "/usr/bin/flask", line 11, in <module>
    load_entry_point('Flask==1.1.1', 'console_scripts', 'flask')()
  File "usr/lib/python3.8/site-packages/flask/cli.py", line 966, in main
  File "usr/lib/python3.8/site-packages/flask/cli.py", line 586, in main
  File "usr/lib/python3.8/site-packages/click/core.py", line 717, in main
  File "usr/lib/python3.8/site-packages/click/core.py", line 1135, in invoke
  File "usr/lib/python3.8/site-packages/click/core.py", line 641, in make_context
  File "usr/lib/python3.8/site-packages/click/core.py", line 940, in parse_args
  File "usr/lib/python3.8/site-packages/click/core.py", line 1476, in handle_parse_result
  File "usr/lib/python3.8/site-packages/click/core.py", line 96, in invoke_param_callback
  File "usr/lib/python3.8/site-packages/flask/cli.py", line 742, in _validate_key
AttributeError: 'NoneType' object has no attribute 'SSLContext'


Now re-added 'select BR2_PACKAGE_PYTHON3_SSL':

	$ diff -u .config.old .config
--- .config.old 2020-04-08 19:49:46.487754298 +0200
+++ .config     2020-04-08 19:56:34.155512376 +0200
@@ -1203,7 +1203,7 @@
 # BR2_PACKAGE_PYTHON3_DECIMAL is not set
 # BR2_PACKAGE_PYTHON3_OSSAUDIODEV is not set
 # BR2_PACKAGE_PYTHON3_READLINE is not set
-# BR2_PACKAGE_PYTHON3_SSL is not set
+BR2_PACKAGE_PYTHON3_SSL=y
 BR2_PACKAGE_PYTHON3_UNICODEDATA=y
 # BR2_PACKAGE_PYTHON3_SQLITE is not set
 BR2_PACKAGE_PYTHON3_PYEXPAT=y
@@ -1674,7 +1674,14 @@
 # BR2_PACKAGE_LIBUECC is not set
 # BR2_PACKAGE_MBEDTLS is not set
 # BR2_PACKAGE_NETTLE is not set
-# BR2_PACKAGE_OPENSSL is not set
+BR2_PACKAGE_OPENSSL=y
+BR2_PACKAGE_LIBOPENSSL=y
+BR2_PACKAGE_LIBOPENSSL_TARGET_ARCH="linux-armv4"
+# BR2_PACKAGE_LIBOPENSSL_BIN is not set
+# BR2_PACKAGE_LIBOPENSSL_ENGINES is not set
+# BR2_PACKAGE_LIBRESSL is not set
+BR2_PACKAGE_HAS_OPENSSL=y
+BR2_PACKAGE_PROVIDES_OPENSSL="libopenssl"
 BR2_PACKAGE_PROVIDES_HOST_OPENSSL="host-libopenssl"
 # BR2_PACKAGE_RHASH is not set
 # BR2_PACKAGE_TINYDTLS is not set


	$ env FLASK_APP=hello.py flask run --host=0.0.0.0
 * Serving Flask app "hello.py"
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
172.16.0.1 - - [01/Jan/1970 00:02:17] "GET / HTTP/1.1" 200 -

Voila! A running flask hello-world...

Your are right, the adding of the python-lxml was wrong (suspect the
selectiob of expat/pyexpat via setuptools is enough and the thing
I missed on the first run), but the other dependencies are needed...,
will send an patch to revert the python-lxml dependency...

Regards,
Peter

[1] https://flask.palletsprojects.com/en/1.1.x/quickstart/#quickstart
