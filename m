From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:13:06 +0100
Subject: [Buildroot] [PATCH 04/10] package: add python-docker
In-Reply-To: <20180309191701.23760-5-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-5-peter@korsgaard.com>
Message-ID: <CAGm1_kvh0bgQZQDfC3WhC1vZ7+wnFF89sn4yV44jUzUSCLTqeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Python library for the Docker Engine API.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                         |  1 +
>  package/Config.in                                  |  1 +
>  .../0001-setup.py-make-pip-optional.patch          | 50 ++++++++++++++++++++++
>  package/python-docker/Config.in                    | 15 +++++++
>  package/python-docker/python-docker.hash           |  4 ++
>  package/python-docker/python-docker.mk             | 14 ++++++
>  6 files changed, 85 insertions(+)
>  create mode 100644 package/python-docker/0001-setup.py-make-pip-optional.patch
>  create mode 100644 package/python-docker/Config.in
>  create mode 100644 package/python-docker/python-docker.hash
>  create mode 100644 package/python-docker/python-docker.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 34ecfeeb02..9b68652b5f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1385,6 +1385,7 @@ F:        package/memtool/
>  F:     package/mosquitto/
>  F:     package/python-alsaaudio/
>  F:     package/python-backports-ssl-match-hostname/
> +F:     package/python-docker/
>  F:     package/python-docker-pycreds/
>  F:     package/python-enum/
>  F:     package/python-enum34/
> diff --git a/package/Config.in b/package/Config.in
> index d3018aee47..c1bf7067aa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -766,6 +766,7 @@ menu "External python modules"
>         source "package/python-dialog3/Config.in"
>         source "package/python-dicttoxml/Config.in"
>         source "package/python-django/Config.in"
> +       source "package/python-docker/Config.in"
>         source "package/python-docker-pycreds/Config.in"
>         source "package/python-docopt/Config.in"
>         source "package/python-docutils/Config.in"
> diff --git a/package/python-docker/0001-setup.py-make-pip-optional.patch b/package/python-docker/0001-setup.py-make-pip-optional.patch
> new file mode 100644
> index 0000000000..d9c958311d
> --- /dev/null
> +++ b/package/python-docker/0001-setup.py-make-pip-optional.patch
> @@ -0,0 +1,50 @@
> +From 978643b7222db66837d39037f884be01fb9af234 Mon Sep 17 00:00:00 2001
> +From: Peter Korsgaard <peter@korsgaard.com>
> +Date: Fri, 9 Mar 2018 18:40:16 +0100
> +Subject: [PATCH] setup.py: make pip optional
> +
> +pip may not be available on the build host, and it is only used to check if
> +docker-py is already installed, so skip the check if pip isn't available.
> +
> +[Upstream-status: submitted (https://github.com/docker/docker-py/pull/1948)]
> +Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> +---
> + setup.py | 20 ++++++++++++--------
> + 1 file changed, 12 insertions(+), 8 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 271d94f..c9b91a3 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -5,16 +5,20 @@ import codecs
> + import os
> + import sys
> +
> +-import pip
> +-
> + from setuptools import setup, find_packages
> +
> +-if 'docker-py' in [x.project_name for x in pip.get_installed_distributions()]:
> +-    print(
> +-        'ERROR: "docker-py" needs to be uninstalled before installing this'
> +-        ' package:\npip uninstall docker-py', file=sys.stderr
> +-    )
> +-    sys.exit(1)
> ++try:
> ++    import pip
> ++
> ++    if 'docker-py' in \
> ++            [x.project_name for x in pip.get_installed_distributions()]:
> ++        print(
> ++            'ERROR: "docker-py" needs to be uninstalled before installing this'
> ++            ' package:\npip uninstall docker-py', file=sys.stderr
> ++        )
> ++        sys.exit(1)
> ++except ImportError:
> ++    pass
> +
> + ROOT_DIR = os.path.dirname(__file__)
> + SOURCE_DIR = os.path.join(ROOT_DIR)
> +--
> +2.11.0
> +
> diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
> new file mode 100644
> index 0000000000..35f7666f19
> --- /dev/null
> +++ b/package/python-docker/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_PYTHON_DOCKER
> +       bool "python-docker"
> +       # docker-engine may be running on another host, so no dependency
> +       select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
> +       select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME \
> +              if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON_REQUESTS # runtime
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
> +       select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
> +       select BR2_PACKAGE_PYTHON_DOCKER_PYCREDS # runtime
> +       help
> +         A Python library for the Docker Engine API.
> +
> +         https://github.com/docker/docker-py
> diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
> new file mode 100644
> index 0000000000..c09ccc3859
> --- /dev/null
> +++ b/package/python-docker/python-docker.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/docker/json, sha256 locally computed
> +md5    71e97726a8bdc56effa7df8321c47af1  docker-3.1.1.tar.gz
> +sha256 462165ca6367f802280684ab44e581cd2efba8995d78d07ea994e42194927c3b  docker-3.1.1.tar.gz
> +sha256 f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
> diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
> new file mode 100644
> index 0000000000..fb9b32a603
> --- /dev/null
> +++ b/package/python-docker/python-docker.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-docker
> +#
> +################################################################################
> +
> +PYTHON_DOCKER_VERSION = 3.1.1
> +PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
> +PYTHON_DOCKER_SITE = https://pypi.python.org/packages/0d/17/ad98e025e5528337c4dc5835a5874898eb226da17e4ffed732c894cb1938
> +PYTHON_DOCKER_SETUP_TYPE = setuptools
> +PYTHON_DOCKER_LICENSE = Apache-2.0
> +PYTHON_DOCKER_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.11.0
><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9, 2018 at 8:16 PM, Peter Korsgaard <span dir="ltr">&lt;<a href="mailto:peter@korsgaard.com" target="_blank">peter at korsgaard.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Python library for the Docker Engine API.<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
---<br>
&nbsp;DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +<br>
&nbsp;package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; |&nbsp; 1 +<br>
&nbsp;.../0001-setup.py-make-pip-<wbr>optional.patch&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; | 50 ++++++++++++++++++++++<br>
&nbsp;package/python-docker/Config.<wbr>in&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 15 +++++++<br>
&nbsp;package/python-docker/python-<wbr>docker.hash&nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 4 ++<br>
&nbsp;package/python-docker/<a href="http://python-docker.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker.mk&amp;source=gmail&amp;ust=1520748594570000&amp;usg=AFQjCNFkTaZTN_mB9Y3cK5Q_OpOo_5CCAg"
rel="noreferrer" target="_blank">python-<wbr>docker.mk</a>&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 14 ++++++<br>
&nbsp;6 files changed, 85 insertions(+)<br>
&nbsp;create mode 100644
package/python-docker/0001-<wbr>setup.py-make-pip-optional.<wbr>patch<br>
&nbsp;create mode 100644 package/python-docker/Config.<wbr>in<br>
&nbsp;create mode 100644 package/python-docker/python-<wbr>docker.hash<br>
&nbsp;create mode 100644 package/python-docker/<a
href="http://python-docker.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker.mk&amp;source=gmail&amp;ust=1520748594571000&amp;usg=AFQjCNGrYK9i-pzoUm9xMFBZR6Paz2M7NA"
rel="noreferrer" target="_blank">python-<wbr>docker.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index 34ecfeeb02..9b68652b5f 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1385,6 +1385,7 @@ F:&nbsp; &nbsp; &nbsp; &nbsp; package/memtool/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/mosquitto/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-alsaaudio/<br>
&nbsp;F:&nbsp; &nbsp;
&nbsp;package/python-backports-ssl-<wbr>match-hostname/<br>
+F:&nbsp; &nbsp; &nbsp;package/python-docker/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-docker-pycreds/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/python-enum34/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index d3018aee47..c1bf7067aa 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -766,6 +766,7 @@ menu "External python modules"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-dialog3/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-dicttoxml/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-django/Config.<wbr>in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source "package/python-docker/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/python-docker-<wbr>pycreds/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-docopt/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/python-docutils/<wbr>Config.in"<br>
diff --git a/package/python-docker/0001-<wbr>setup.py-make-pip-optional.<wbr>patch
b/package/python-docker/0001-<wbr>setup.py-make-pip-optional.<wbr>patch<br>
new file mode 100644<br>
index 0000000000..d9c958311d<br>
--- /dev/null<br>
+++ b/package/python-docker/0001-<wbr>setup.py-make-pip-optional.<wbr>patch<br>
@@ -0,0 +1,50 @@<br>
+From 978643b7222db66837d39037f884be<wbr>01fb9af234 Mon Sep 17 00:00:00 2001<br>
+From: Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
+Date: Fri, 9 Mar 2018 18:40:16 +0100<br>
+Subject: [PATCH] setup.py: make pip optional<br>
+<br>
+pip may not be available on the build host, and it is only used to check if<br>
+docker-py is already installed, so skip the check if pip isn't available.<br>
+<br>
+[Upstream-status: submitted (<a
href="https://github.com/docker/docker-py/pull/1948"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://github.com/docker/docker-py/pull/1948&amp;source=gmail&amp;ust=1520748594572000&amp;usg=AFQjCNHDZXpNAvGi-fBwownn-Vtxc9MWSQ"
rel="noreferrer"
target="_blank">https://github.com/docker/<wbr>docker-py/pull/1948</a>)]<br>
+Signed-off-by: Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
+---<br>
+ setup.py | 20 ++++++++++++--------<br>
+ 1 file changed, 12 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/setup.py b/setup.py<br>
+index 271d94f..c9b91a3 100644<br>
+--- a/setup.py<br>
++++ b/setup.py<br>
+@@ -5,16 +5,20 @@ import codecs<br>
+ import os<br>
+ import sys<br>
+<br>
+-import pip<br>
+-<br>
+ from setuptools import setup, find_packages<br>
+<br>
+-if 'docker-py' in [x.project_name for x in
pip.get_installed_<wbr>distributions()]:<br>
+-&nbsp; &nbsp; print(<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; 'ERROR: "docker-py" needs to be
uninstalled before installing this'<br>
+-&nbsp; &nbsp; &nbsp; &nbsp; ' package:\npip uninstall docker-py',
file=sys.stderr<br>
+-&nbsp; &nbsp; )<br>
+-&nbsp; &nbsp; sys.exit(1)<br>
++try:<br>
++&nbsp; &nbsp; import pip<br>
++<br>
++&nbsp; &nbsp; if 'docker-py' in \<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [x.project_name for x in
pip.get_installed_<wbr>distributions()]:<br>
++&nbsp; &nbsp; &nbsp; &nbsp; print(<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'ERROR: "docker-py" needs
to be uninstalled before installing this'<br>
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ' package:\npip uninstall
docker-py', file=sys.stderr<br>
++&nbsp; &nbsp; &nbsp; &nbsp; )<br>
++&nbsp; &nbsp; &nbsp; &nbsp; sys.exit(1)<br>
++except ImportError:<br>
++&nbsp; &nbsp; pass<br>
+<br>
+ ROOT_DIR = os.path.dirname(__file__)<br>
+ SOURCE_DIR = os.path.join(ROOT_DIR)<br>
+--<br>
+2.11.0<br>
+<br>
diff --git a/package/python-docker/<wbr>Config.in
b/package/python-docker/<wbr>Config.in<br>
new file mode 100644<br>
index 0000000000..35f7666f19<br>
--- /dev/null<br>
+++ b/package/python-docker/<wbr>Config.in<br>
@@ -0,0 +1,15 @@<br>
+config BR2_PACKAGE_PYTHON_DOCKER<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "python-docker"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;# docker-engine may be running on another
host, so no dependency<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_SSL if
BR2_PACKAGE_PYTHON # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON3_SSL if
BR2_PACKAGE_PYTHON3 # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select
BR2_PACKAGE_PYTHON_BACKPORTS_<wbr>SSL_MATCH_HOSTNAME \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if
BR2_PACKAGE_PYTHON # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_REQUESTS # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_SIX # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select
BR2_PACKAGE_PYTHON_WEBSOCKET_<wbr>CLIENT # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select
BR2_PACKAGE_PYTHON_DOCKER_<wbr>PYCREDS # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;A Python library for the Docker
Engine API.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a
href="https://github.com/docker/docker-py"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://github.com/docker/docker-py&amp;source=gmail&amp;ust=1520748594573000&amp;usg=AFQjCNF9QydN82-8QHWzRCgi3Z6d9DCLjQ"
rel="noreferrer"
target="_blank">https://github.com/docker/<wbr>docker-py</a><br>
diff --git a/package/python-docker/<wbr>python-docker.hash
b/package/python-docker/<wbr>python-docker.hash<br>
new file mode 100644<br>
index 0000000000..c09ccc3859<br>
--- /dev/null<br>
+++ b/package/python-docker/<wbr>python-docker.hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/docker/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/docker/json&amp;source=gmail&amp;ust=1520748594573000&amp;usg=AFQjCNE2OL0ZasNlXc7Y21lX287y3m4pTQ"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>docker/json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; 71e97726a8bdc56effa7df8321c47a<wbr>f1&nbsp;
docker-3.1.1.tar.gz<br>
+sha256 462165ca6367f802280684ab44e581<wbr>cd2efba8995d78d07ea994e4219492<wbr>7c3b&nbsp;
docker-3.1.1.tar.gz<br>
+sha256 f2f0b07fa5e492c11d27aa0d2f3f1a<wbr>0e64b9d17f32d8aa489ae2af9609af<wbr>33b2&nbsp;
LICENSE<br>
diff --git a/package/python-docker/<a href="http://python-docker.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker.mk&amp;source=gmail&amp;ust=1520748594574000&amp;usg=AFQjCNG6TVr6-2bAOBfvWcCf7ycdbqSwcg"
rel="noreferrer" target="_blank">python<wbr>-docker.mk</a>
b/package/python-docker/<a href="http://python-docker.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker.mk&amp;source=gmail&amp;ust=1520748594574000&amp;usg=AFQjCNG6TVr6-2bAOBfvWcCf7ycdbqSwcg"
rel="noreferrer" target="_blank">python<wbr>-docker.mk</a><br>
new file mode 100644<br>
index 0000000000..fb9b32a603<br>
--- /dev/null<br>
+++ b/package/python-docker/<a href="http://python-docker.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://python-docker.mk&amp;source=gmail&amp;ust=1520748594574000&amp;usg=AFQjCNG6TVr6-2bAOBfvWcCf7ycdbqSwcg"
rel="noreferrer" target="_blank">python<wbr>-docker.mk</a><br>
@@ -0,0 +1,14 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# python-docker<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+PYTHON_DOCKER_VERSION = 3.1.1<br>
+PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_<wbr>VERSION).tar.gz<br>
+PYTHON_DOCKER_SITE = <a
href="https://pypi.python.org/packages/0d/17/ad98e025e5528337c4dc5835a5874898eb226da17e4ffed732c894cb1938"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/0d/17/ad98e025e5528337c4dc5835a5874898eb226da17e4ffed732c894cb1938&amp;source=gmail&amp;ust=1520748594575000&amp;usg=AFQjCNG8WpHL52w--TjThRVE5lKgTZm3lw"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/0d/17/<wbr>ad98e025e5528337c4dc5835a58748<wbr>98eb226da17e4ffed732c894cb1938</a><br>
+PYTHON_DOCKER_SETUP_TYPE = setuptools<br>
+PYTHON_DOCKER_LICENSE = Apache-2.0<br>
+PYTHON_DOCKER_LICENSE_FILES = LICENSE<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
