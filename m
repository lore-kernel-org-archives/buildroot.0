From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Jan 2015 23:02:00 +0100
Subject: [Buildroot] [RFC] pkg-generic: add per-package staging directory
In-Reply-To: <1422602264-4725-1-git-send-email-Fabio.Porcedda@gmail.com>
References: <1422602264-4725-1-git-send-email-Fabio.Porcedda@gmail.com>
Message-ID: <20150131230200.0490cafe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Fri, 30 Jan 2015 08:17:44 +0100, Fabio Porcedda wrote:
> This commit add a per-package staging directory under output/stagingof/
> to improve build reproducibility, because it prevents that a unspecified
> dependency affects the build.
> 
> It also help to enable default top-level parallel make.

Thanks for attempting to look at this complicated problem. However,
there is a fairly fundamental flaw in your proposal:

> +$(2)_TARGET_CPPFLAGS += $(foreach dep,$($(2)_DEPENDENCIES),\
> +	-I$(STAGINGOF_DIR)/$(dep)/usr/include)

How is this going to account for headers installed in subdirs
of /usr/include ? Those are normally discovered using pkg-config for
example. But with your solution, pkg-config will continue to return
paths in the "common" staging directory.

My perception is that it's not really feasible to have one staging
directory per-package, because it means that pkg-config would have to
know, depending on which library it is asked to provide information
for, should use a different sysroot dir.

I believe the only solution is to create a temporary staging directory
in which you copy/extract only the libraries that are explicitly listed
as the dependency of the package being built.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
