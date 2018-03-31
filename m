From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 31 Mar 2018 17:17:51 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: use
 --no-check-certificate in wget by default
Message-ID: <20180331151803.0A59C83FD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0866a280e40a7a2c7d7d50cc7e87c3f4652aff0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A number of autobuilder failures are due to the fact that autobuilder
instances use old distributions, with old SSL certificates, and
therefore wget aborts with an error "The certificate of `xyz.org' is
not trusted.".

In order to avoid such failures that are not very interesting in the
context of the autobuilders, we pass --no-check-certificate to
wget. The integrity of the downloaded files is anyway verified by the
hashes, and this is only meant to be used in the context of
testing/CI, not in production.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 07882200e0..06701ce565 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -349,6 +349,9 @@ def gen_config(args):
     with open(minimalconfigfile) as minimalf:
         configlines += minimalf.readlines()
 
+    # Allow hosts with old certificates to download over https
+    configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"")
+
     # Amend the configuration with a few things.
     if randint(0, 20) == 0:
         configlines.append("BR2_ENABLE_DEBUG=y\n")
