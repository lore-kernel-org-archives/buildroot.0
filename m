From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 23 Nov 2016 14:39:12 +0000
Subject: [Buildroot] [PATCH next 4/6] moarvm: select libffi when building
	for MIPS
In-Reply-To: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
References: <20161123143914.3969-1-Vincent.Riera@imgtec.com>
Message-ID: <20161123143914.3969-4-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the compilation will fail like this:

./libmoar.so: undefined reference to `dcCallbackThunkEntry'

See: https://github.com/MoarVM/MoarVM/issues/222

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/moarvm/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/moarvm/Config.in b/package/moarvm/Config.in
index 3e0a104..76343d1 100644
--- a/package/moarvm/Config.in
+++ b/package/moarvm/Config.in
@@ -9,6 +9,9 @@ config BR2_PACKAGE_MOARVM
 	select BR2_PACKAGE_LIBUV
 	select BR2_PACKAGE_LIBTOMMATH
 	select BR2_PACKAGE_LIBATOMIC_OPS
+	# dyncall does not work on MIPS; libffi needs to be used.
+	# See: https://github.com/MoarVM/MoarVM/issues/222
+	select BR2_PACKAGE_LIBFFI if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	help
 	  Short for "Metamodel On A Runtime", MoarVM is a virtual machine
 	  built especially for Rakudo Perl 6 and the NQP Compiler Toolchain.
-- 
2.10.1
