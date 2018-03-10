From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 10 Mar 2018 07:18:31 +0100
Subject: [Buildroot] [PATCH 10/10] package: add docker-compose
In-Reply-To: <20180309191701.23760-11-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
 <20180309191701.23760-11-peter@korsgaard.com>
Message-ID: <CAGm1_kukR5smYd_c6XTdhUYjx9yBhxxn8q_6X07jcY_1azVUwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2018 at 8:17 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> Python based multi-container orchestration for Docker.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/docker-compose/Config.in           | 29 +++++++++++++++++++++++++++++
>  package/docker-compose/docker-compose.hash |  4 ++++
>  package/docker-compose/docker-compose.mk   | 13 +++++++++++++
>  5 files changed, 48 insertions(+)
>  create mode 100644 package/docker-compose/Config.in
>  create mode 100644 package/docker-compose/docker-compose.hash
>  create mode 100644 package/docker-compose/docker-compose.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e6dc51e1fe..f702c01152 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1373,6 +1373,7 @@ F:        package/libunistring/
>  N:     Peter Korsgaard <peter@korsgaard.com>
>  F:     board/orangepi/
>  F:     configs/orangepi_pc_defconfig
> +F:     package/docker-compose/
>  F:     package/dump1090/
>  F:     package/flickcurl/
>  F:     package/fscryptctl/
> diff --git a/package/Config.in b/package/Config.in
> index 6fd61a0dea..37465c7f5b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1959,6 +1959,7 @@ menu "System tools"
>         source "package/dcron/Config.in"
>         source "package/ddrescue/Config.in"
>         source "package/debianutils/Config.in"
> +       source "package/docker-compose/Config.in"
>         source "package/docker-containerd/Config.in"
>         source "package/docker-engine/Config.in"
>         source "package/dsp-tools/Config.in"
> diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
> new file mode 100644
> index 0000000000..393b5f1a0d
> --- /dev/null
> +++ b/package/docker-compose/Config.in
> @@ -0,0 +1,29 @@
> +config BR2_PACKAGE_DOCKER_COMPOSE
> +       bool "docker-compose"
> +       depends on BR2_USE_MMU # python
> +       depends on BR2_USE_WCHAR # python
> +       depends on BR2_TOOLCHAIN_HAS_THREADS # python
> +       depends on !BR2_STATIC_LIBS # python
> +       select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME \
> +              if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
> +       select BR2_PACKAGE_PYTHON_CACHED_PROPERTY # runtime
> +       select BR2_PACKAGE_PYTHON_DOCOPT # runtime
> +       select BR2_PACKAGE_PYTHON_PYYAML # runtime
> +       select BR2_PACKAGE_PYTHON_REQUESTS # runtime
> +       select BR2_PACKAGE_PYTHON_TEXTTABLE # runtime
> +       select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
> +       select BR2_PACKAGE_PYTHON_DOCKER # runtime
> +       select BR2_PACKAGE_PYTHON_DOCKERPTY # runtime
> +       select BR2_PACKAGE_PYTHON_SIX # runtime
> +       select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
> +       help
> +         Multi-container orchestration for Docker.
> +
> +         https://www.docker.com/
> +
> +comment "docker-compose needs a toolchain w/ wchar, threads, dynamic library"
> +       depends on BR2_USE_MMU
> +       depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
> new file mode 100644
> index 0000000000..df4d915469
> --- /dev/null
> +++ b/package/docker-compose/docker-compose.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/docker-compose/json, sha256 locally computed
> +md5    bd703d931f159b08ed5fe4fadcb12652  docker-compose-1.20.0rc1.tar.gz
> +sha256 ad14f8dda3eb5c999f6195bf88420dafd1aada80535dab3afd3350fe8438e0a3  docker-compose-1.20.0rc1.tar.gz
> +sha256 552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
> diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
> new file mode 100644
> index 0000000000..155c529391
> --- /dev/null
> +++ b/package/docker-compose/docker-compose.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# docker-compose
> +#
> +################################################################################
> +
> +DOCKER_COMPOSE_VERSION = 1.20.0rc1
> +DOCKER_COMPOSE_SITE = https://pypi.python.org/packages/ca/d9/21266285a3c34e8e023f2504c13ffb48e6acd1e43ccdd0c55188d7039505
> +DOCKER_COMPOSE_SETUP_TYPE = setuptools
> +DOCKER_COMPOSE_LICENSE = Apache-2.0
> +DOCKER_COMPOSE_LICENSE_FILES = LICENSE
> +
> +$(eval $(python-package))
> --
> 2.11.0
><div class="gmail_extra"><br><div class="gmail_quote">On Fri, Mar 9, 2018 at 8:17 PM, Peter Korsgaard <span dir="ltr">&lt;<a href="mailto:peter@korsgaard.com" target="_blank">peter at korsgaard.com</a>&gt;</span> wrote:<br><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Python based multi-container orchestration for Docker.<br>
<br>
Signed-off-by: Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
---<br>
&nbsp;DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp;|&nbsp; 1 +<br>
&nbsp;package/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 +<br>
&nbsp;package/docker-compose/Config.<wbr>in&nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp;| 29 +++++++++++++++++++++++++++++<br>
&nbsp;package/docker-compose/docker-<wbr>compose.hash |&nbsp; 4 ++++<br>
&nbsp;package/docker-compose/<a href="http://docker-compose.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://docker-compose.mk&amp;source=gmail&amp;ust=1520748594535000&amp;usg=AFQjCNFI2TOdbad6BVU8WX8d8y22sx_UQw"
rel="noreferrer" target="_blank">docker-<wbr>compose.mk</a>&nbsp;
&nbsp;| 13 +++++++++++++<br>
&nbsp;5 files changed, 48 insertions(+)<br>
&nbsp;create mode 100644 package/docker-compose/Config.<wbr>in<br>
&nbsp;create mode 100644 package/docker-compose/docker-<wbr>compose.hash<br>
&nbsp;create mode 100644 package/docker-compose/<a
href="http://docker-compose.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://docker-compose.mk&amp;source=gmail&amp;ust=1520748594535000&amp;usg=AFQjCNFI2TOdbad6BVU8WX8d8y22sx_UQw"
rel="noreferrer" target="_blank">docker-<wbr>compose.mk</a><br>
<br>
diff --git a/DEVELOPERS b/DEVELOPERS<br>
index e6dc51e1fe..f702c01152 100644<br>
--- a/DEVELOPERS<br>
+++ b/DEVELOPERS<br>
@@ -1373,6 +1373,7 @@ F:&nbsp; &nbsp; &nbsp; &nbsp; package/libunistring/<br>
&nbsp;N:&nbsp; &nbsp; &nbsp;Peter Korsgaard &lt;<a
href="mailto:peter@korsgaard.com">peter at korsgaard.com</a>&gt;<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;board/orangepi/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;configs/orangepi_pc_defconfig<br>
+F:&nbsp; &nbsp; &nbsp;package/docker-compose/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/dump1090/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/flickcurl/<br>
&nbsp;F:&nbsp; &nbsp; &nbsp;package/fscryptctl/<br>
diff --git a/package/Config.in b/package/Config.in<br>
index 6fd61a0dea..37465c7f5b 100644<br>
--- a/package/Config.in<br>
+++ b/package/Config.in<br>
@@ -1959,6 +1959,7 @@ menu "System tools"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/dcron/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/ddrescue/Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/debianutils/Config.<wbr>in"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;source "package/docker-compose/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source
"package/docker-containerd/<wbr>Config.in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/docker-engine/Config.<wbr>in"<br>
&nbsp; &nbsp; &nbsp; &nbsp; source "package/dsp-tools/Config.in"<br>
diff --git a/package/docker-compose/<wbr>Config.in
b/package/docker-compose/<wbr>Config.in<br>
new file mode 100644<br>
index 0000000000..393b5f1a0d<br>
--- /dev/null<br>
+++ b/package/docker-compose/<wbr>Config.in<br>
@@ -0,0 +1,29 @@<br>
+config BR2_PACKAGE_DOCKER_COMPOSE<br>
+&nbsp; &nbsp; &nbsp; &nbsp;bool "docker-compose"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;depends on BR2_USE_MMU # python<br>
+&nbsp; &nbsp; &nbsp; &nbsp;depends on BR2_USE_WCHAR # python<br>
+&nbsp; &nbsp; &nbsp; &nbsp;depends on BR2_TOOLCHAIN_HAS_THREADS # python<br>
+&nbsp; &nbsp; &nbsp; &nbsp;depends on !BR2_STATIC_LIBS # python<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON3 if
!BR2_PACKAGE_PYTHON<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select
BR2_PACKAGE_PYTHON_BACKPORTS_<wbr>SSL_MATCH_HOSTNAME \<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if
BR2_PACKAGE_PYTHON # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_ENUM34 if
BR2_PACKAGE_PYTHON # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_IPADDRESS if
BR2_PACKAGE_PYTHON # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select
BR2_PACKAGE_PYTHON_CACHED_<wbr>PROPERTY # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_DOCOPT # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_PYYAML # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_REQUESTS # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_TEXTTABLE # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select
BR2_PACKAGE_PYTHON_WEBSOCKET_<wbr>CLIENT # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_DOCKER # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_DOCKERPTY # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_SIX # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime<br>
+&nbsp; &nbsp; &nbsp; &nbsp;help<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Multi-container orchestration for Docker.<br>
+<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a href="https://www.docker.com/"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://www.docker.com/&amp;source=gmail&amp;ust=1520748594536000&amp;usg=AFQjCNFGffSaXV2QJksXCJxlJMcGFGRNpQ"
rel="noreferrer" target="_blank">https://www.docker.com/</a><br>
+<br>
+comment "docker-compose needs a toolchain w/ wchar, threads, dynamic
library"<br>
+&nbsp; &nbsp; &nbsp; &nbsp;depends on BR2_USE_MMU<br>
+&nbsp; &nbsp; &nbsp; &nbsp;depends on !BR2_USE_WCHAR ||
!BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS<br>
diff --git a/package/docker-compose/<wbr>docker-compose.hash
b/package/docker-compose/<wbr>docker-compose.hash<br>
new file mode 100644<br>
index 0000000000..df4d915469<br>
--- /dev/null<br>
+++ b/package/docker-compose/<wbr>docker-compose.hash<br>
@@ -0,0 +1,4 @@<br>
+# md5 from <a href="https://pypi.python.org/pypi/docker-compose/json"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/pypi/docker-compose/json&amp;source=gmail&amp;ust=1520748594537000&amp;usg=AFQjCNGwcrCm_AzYgYwCxn0j2WqS0nkWMA"
rel="noreferrer"
target="_blank">https://pypi.python.org/pypi/<wbr>docker-compose/json</a>,
sha256 locally computed<br>
+md5&nbsp; &nbsp; bd703d931f159b08ed5fe4fadcb126<wbr>52&nbsp;
docker-compose-1.20.0rc1.tar.<wbr>gz<br>
+sha256 ad14f8dda3eb5c999f6195bf88420d<wbr>afd1aada80535dab3afd3350fe8438<wbr>e0a3&nbsp;
docker-compose-1.20.0rc1.tar.<wbr>gz<br>
+sha256 552a739c3b25792263f731542238b9<wbr>2f6f8d07e9a488eae27e6c4690038a<wbr>8243&nbsp;
LICENSE<br>
diff --git a/package/docker-compose/<a href="http://docker-compose.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://docker-compose.mk&amp;source=gmail&amp;ust=1520748594537000&amp;usg=AFQjCNFzceFxnI_4hZjcObILkYiJ2adVpA"
rel="noreferrer" target="_blank">docke<wbr>r-compose.mk</a>
b/package/docker-compose/<a href="http://docker-compose.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://docker-compose.mk&amp;source=gmail&amp;ust=1520748594537000&amp;usg=AFQjCNFzceFxnI_4hZjcObILkYiJ2adVpA"
rel="noreferrer" target="_blank">docke<wbr>r-compose.mk</a><br>
new file mode 100644<br>
index 0000000000..155c529391<br>
--- /dev/null<br>
+++ b/package/docker-compose/<a href="http://docker-compose.mk"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://docker-compose.mk&amp;source=gmail&amp;ust=1520748594537000&amp;usg=AFQjCNFzceFxnI_4hZjcObILkYiJ2adVpA"
rel="noreferrer" target="_blank">docke<wbr>r-compose.mk</a><br>
@@ -0,0 +1,13 @@<br>
+#############################<wbr>##############################<wbr>#####################<br>
+#<br>
+# docker-compose<br>
+#<br>
+#############################<wbr>##############################<wbr>#####################<br>
+<br>
+DOCKER_COMPOSE_VERSION = 1.20.0rc1<br>
+DOCKER_COMPOSE_SITE = <a
href="https://pypi.python.org/packages/ca/d9/21266285a3c34e8e023f2504c13ffb48e6acd1e43ccdd0c55188d7039505"
data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://pypi.python.org/packages/ca/d9/21266285a3c34e8e023f2504c13ffb48e6acd1e43ccdd0c55188d7039505&amp;source=gmail&amp;ust=1520748594538000&amp;usg=AFQjCNEB6FRD7jVzWWb2gegeKrXKYUgrpQ"
rel="noreferrer"
target="_blank">https://pypi.python.org/<wbr>packages/ca/d9/<wbr>21266285a3c34e8e023f2504c13ffb<wbr>48e6acd1e43ccdd0c55188d7039505</a><br>
+DOCKER_COMPOSE_SETUP_TYPE = setuptools<br>
+DOCKER_COMPOSE_LICENSE = Apache-2.0<br>
+DOCKER_COMPOSE_LICENSE_FILES = LICENSE<br>
+<br>
+$(eval $(python-package))<br>
<span class="HOEnZb"><font color="#888888">--<br>
2.11.0<br>
<br>
</font></span></blockquote></div><br></div>
