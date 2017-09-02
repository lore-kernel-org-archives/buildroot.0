From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Sep 2017 23:29:38 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: use --no-check-certificate
	in wget by default
Message-ID: <20170902212938.23712-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 utils/genrandconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a67d46fad9..5ce6015765 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -345,6 +345,9 @@ def gen_config(args):
     with open(minimalconfigfile) as minimalf:
         configlines += minimalf.readlines()
 
+    # Allow hosts with old certificates to download over https
+    configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"")
+
     # Amend the configuration with a few things.
     if randint(0, 20) == 0:
         configlines.append("BR2_ENABLE_DEBUG=y\n")
-- 
2.13.5
