From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 21:20:47 +0100
Subject: [Buildroot] [PATCH v3] toolchain: expose
 BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS for all toolchain types
In-Reply-To: <09e2f480-a076-240d-ea2e-a42c577834a1@mind.be> (Arnout
 Vandecappelle's message of "Mon, 28 Oct 2019 23:12:59 +0100")
References: <20191027205902.56911-1-matthew.weber@rockwellcollins.com>
 <09e2f480-a076-240d-ea2e-a42c577834a1@mind.be>
Message-ID: <87ftj8wtsw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 27/10/2019 21:59, Matt Weber wrote:
 >> This patch extends the "copy extra GCC libraries to target" feature to
 >> also work for internal toolchains. The variable has been renamed to be
 >> BR2_TOOLCHAIN_EXTRA_LIBS and the configuration option moved under the
 >> generic toolchain package. For external toolchains, the step that does
 >> the copy is still in the copy_toolchain_lib_root() helper which copies
 >> from the sysroot to the target.  For the internal toolchain, the host
 >> gcc-final package does a post install hook to copy the libraries from
 >> the toolchain build folders to both the sysroot and target(!static).
 >> 
 >> Examples where this can be useful is for adding debug libraries to the
 >> target like the GCC libsanitizer (libasan/liblsan/...).
 >> 
 >> Cc: Markus Mayer <mmayer@broadcom.com>
 >> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 >  Applied to master, thanks.

 > [snip]
 >> +	  Examples where this can be useful is for adding debug libraries

 >  This line is too long. As reported by check-package. Fortunately, I check for
 > that in a post-apply hook :-)

 >  If you want to do the same, use this as your .git/hooks/post-commit:

 > #! /bin/sh

 > # check-package on added/changed files
 > git show HEAD | \
 >         lsdiff -s | \
 >         awk '{ if ($1 != "-") print substr($2, 3) }' | \
 >         xargs -r ./utils/check-package


 > (note that you need to install lsdiff, and it barfs on renamed or removed files)

Really? We explicitly filter out removed files (the "-" logic). For
renamed files we could probably use git show --no-renamed to have them
listed as a removal + addition.

-- 
Bye, Peter Korsgaard
