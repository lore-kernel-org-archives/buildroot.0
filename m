From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:20:43 +0200
Subject: [Buildroot] [git commit] docs/manual: document both user-facing
	br2-external variables
Message-ID: <20161019212523.A99CD81E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29673c8b1e5d5764fce58b2dcef839d412286552
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While BR2_EXTERNAL_<NAME>_PATH was already documented, it was not
made obvious that it could be reused in post-biuld, post-image and
in-fakeroot scripts.

The BR2_EXTERNAL_<NAME>_DESC variable was not documented at all.

Update the manual to fix this.

Note: a2x chokes on this:

    .Note:
    Both +BR2_EXTERNAL_$(NAME)_PATH+ and +BR2_EXTERNAL_$(NAME)_DESC+ are
      available [...]

and spits out a totally useless error message:

    a2x: ERROR: "xsltproc" --stringparam toc.section.depth 1 --stringparam
    callout.graphics 0 --stringparam navig.graphics 0 --stringparam
    admon.textlabel 1 --stringparam admon.graphic 0 --stringparam
    chunk.section.depth 0 --output "/home/ymorin/dev/buildroot/O/docs/manual/manual.html"
    "/etc/asciidoc/docbook-xsl/xhtml.xsl"
    "/home/ymorin/dev/buildroot/O/docs/manual/manual.xml" returned
    non-zero exit status 6

So, we had to resort to using different quoting styles for each
variables. They are not semantically equivalent, but the rendering
is the same with the default CSS (which we are using). That's gonna
be good-enough for now...

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-outside-br.txt | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index 56c2c8a..70efabe 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -120,7 +120,8 @@ Since it is possible to use multiple br2-external trees at once, this
    and is used when displaying information about a br2-external tree (e.g.
    above the list of defconfig files, or as the prompt in the menuconfig);
    as such, it should relatively brief (40 chars is probably a good upper
-   limit).
+   limit). The description is available in the +BR2_EXTERNAL_$(NAME)_DESC+
+   variable.
 
 Examples of names and the corresponding +BR2_EXTERNAL_$(NAME)_PATH+
 variables:
@@ -130,6 +131,12 @@ variables:
 
 In the following examples, it is assumed the name to be set to +BAR_42+.
 
+.Note:
+Both +BR2_EXTERNAL_$(NAME)_PATH+ and `BR2_EXTERNAL_$(NAME)_DESC` are
+  available in the Kconfig files and the Makefiles. They are also
+  exported in the environment so are available in post-build, post-image
+  and in-fakeroot scripts.
+
 ===== The +Config.in+ and +external.mk+ files
 
 Those files (which may each be empty) can be used to define package
