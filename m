From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jul 2015 10:31:29 +0200
Subject: [Buildroot] [PATCH v2] openssl: always build apps
In-Reply-To: <1436187968-84565-1-git-send-email-benoit@wsystem.com>
References: <1436187968-84565-1-git-send-email-benoit@wsystem.com>
Message-ID: <20150707103129.454a1426@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Mon,  6 Jul 2015 15:06:08 +0200, Beno?t Th?baudeau wrote:
> Now that building the openssl binary without MMU is supported, the only
> reason left for not building apps if the openssl binary is disabled is
> to save build time. Moreover, the commit
> 720893b62510438237b9923d744dd079ddb4f67d "openssl: disable apps for
> NOMMU", which added this behavior, had a side effect: the scripts from
> apps (CA.pl, CA.sh and tsget) and the default configuration file
> (openssl.cnf) were no longer installed, which is not advertized by the
> BR2_PACKAGE_OPENSSL_BIN option. CA.pl and CA.sh use the openssl binary,
> so not installing them without the latter makes sense. But tsget does
> not use the openssl binary, and openssl.cnf can be used by libcrypto, so
> it is preferable to handle BR2_PACKAGE_OPENSSL_BIN like before the
> commit mentioned above, i.e. to always build and install apps and to
> just remove the openssl binary afterwards if needed.
> 
> This is what the current commit does, but installing only the helper
> scripts having their dependencies (perl or the openssl binary)
> satisfied. The help text is updated accordingly.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>

This patch is causing some build failures:

  http://autobuild.buildroot.org/results/cbb/cbb35f2582f1cfeb3d11cb4952a80784ff660baf/build-end.log

Now, applications are being built on noMMU systems. But when using
Blackfin FLAT, libdl is not available. And generally speaking libdl is
not available for static only builds.

According to the PROBLEMS file in openssl source code, passing no-dso
(which we are doing) is not sufficient, and the Makefile need to be
hand-edited to remove the -ldl flag. Could you try that and submit a
patch fixing this build issue?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
