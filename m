From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 08 Apr 2020 23:04:29 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/python-flask: fix runtime
 python modules dependencies
In-Reply-To: <20200408224025.088155ab@gmx.net> (Peter Seiderer's message of
 "Wed, 8 Apr 2020 22:40:25 +0200")
References: <20200322211002.30765-1-ps.report@gmx.net>
 <20200322211002.30765-2-ps.report@gmx.net>
 <87h7xvp760.fsf@dell.be.48ers.dk> <20200408224025.088155ab@gmx.net>
Message-ID: <87r1wxheoy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Hello Peter,
 > On Tue, 07 Apr 2020 18:55:19 +0200, Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:
 >> 
 >> > - add python setuptools runtime dependency, fixes:
 >> >   ModuleNotFoundError: No module named 'pkg_resources'
 >> 
 >> Hmm, the only instance of pkg_resources I see is in src/flask/cli.py:
 >> 
 >> def _load_plugin_commands(self):
 >> if self._loaded_plugin_commands:
 >> return
 >> try:
 >> import pkg_resources
 >> except ImportError:
 >> self._loaded_plugin_commands = True
 >> return
 >> 
 >> for ep in pkg_resources.iter_entry_points("flask.commands"):
 >> self.add_command(ep.load(), ep.name)
 >> self._loaded_plugin_commands = True
 >> 
 >> Which seems to nicely deal with missing pkg_resources.

 > Did re-run my flask test (reverted this patch) and try to run a simple hello
 > world example (from [1]):

 >         $ cat hello.py
 > from flask import Flask

 > app = Flask(__name__)

 > @app.route('/')
 > def hello_world():
 >     return 'Hello, World!'

 >         $ env FLASK_APP=hello.py flask run --host=0.0.0.0
 > Traceback (most recent call last):
 >   File "/usr/bin/flask", line 6, in <module>
 >     from pkg_resources import load_entry_point
 > ModuleNotFoundError: No module named 'pkg_resources'

Ahh, indeed. The click stuff generates the flask script, so that is why
it isn't in the source tree and I didn't see it with grep.

The other feedback should be correct though.

-- 
Bye, Peter Korsgaard
