From: John Keeping <john@metanate.com>
Date: Fri, 27 Apr 2018 11:31:19 +0100
Subject: [Buildroot] [PATCH] support/scripts/check-uniq-files: ignore
 reinstalled packages
In-Reply-To: <1437404419.346987.1524766955385.JavaMail.zimbra@datacom.ind.br>
References: <20180426162731.4710-1-john@metanate.com>
 <1437404419.346987.1524766955385.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20180427113119.591e8441.john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Apr 2018 15:22:35 -0300 (BRT)
Henrique Marks <henrique.marks@datacom.ind.br> wrote:

> ----- Mensagem original -----
> > De: "John Keeping" <john@metanate.com>
> > Para: buildroot at buildroot.org
> > Cc: "John Keeping" <john@metanate.com>
> > Enviadas: Quinta-feira, 26 de abril de 2018 13:27:31
> > Assunto: [Buildroot] [PATCH] support/scripts/check-uniq-files:
> > ignore reinstalled packages  
> 
> > If a package is rebuilt, then any files it installs will be listed
> > multiple times in the file list and check-uniq-files will report
> > that these files are touched by more than one package even though
> > it is the same package listed multiple times.
> > 
> > Switch to storing the package names in a set so that each package
> > can only appear once.
> 
> I can confirm we have problems rebuilding packages using buildroot
> 2018-02.1. The 3 files "package-file-list" are increasing in size
> when we rebuild packages (make <pkg>-rebuild or make
> <pkg>-reinstall), and the compilation time is increasing linearly
> with every rebuild, but the increase is noticeable.

I hadn't considered this aspect of the problem.  Maybe we are better
fixing the root cause of the problem with a patch like this:

-- >8 --
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1c9dd1d734..edc2c9349c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -64,6 +64,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
 # $(3): suffix of file  (optional)
 define step_pkg_size_inner
 	cd $(2); \
+	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt; \
 	find . \( -type f -o -type l \) \
 		-newer $($(PKG)_DIR)/.stamp_built \
 		-exec printf '$(1),%s\n' {} + \
-- 8< --

But I don't know enough about the build process to know if this is safe
in the presence of top-level parallel build.


Regards,
John
