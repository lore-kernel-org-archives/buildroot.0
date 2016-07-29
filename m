From: David Raeman <draeman@bbn.com>
Date: Fri, 29 Jul 2016 15:35:19 -0400
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
	HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <CAMKF1spxedbMXzPnDU41nEFZdJ1qfc4Y0UqeQwxDaNmR4cmZHg@mail.gmail.com>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160728220029.GI5862@free.fr>
 <48B4EC85-773A-4F99-96D4-59577018BAB3@gmail.com>
 <20160729093218.36d66c86@free-electrons.com>
 <CAMKF1sp5YvKanMM_AjPsZqmNOXrJAWsELpEcch+7Wec3MfhVzA@mail.gmail.com>
 <20160729112327.5af5618a@free-electrons.com>
 <CAMKF1spxedbMXzPnDU41nEFZdJ1qfc4Y0UqeQwxDaNmR4cmZHg@mail.gmail.com>
Message-ID: <004001d1e9d0$5773c7d0$065b5770$@bbn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Jul 29, 2016 at 11:09 AM, Khem Raj <raj.khem@gmail.com> wrote:
> with specifying your own -isystem you will be introducing the issue too see
> this thread for more
> https://lists.fedoraproject.org/archives/list/devel at lists.fedoraproject.org/t
> hread/Q5SWCUUMWQ4EMS7CU2CBOZHV3WZYOOTT/

Yes, I see what you mean.  GCC-6 is now using #include_next in its C++ standard library header files to help the C++ STL header files properly find their own special copy of stdlib.h.  The behavior of #include_next will change depending on the order of the directories in the include search path.  Based on these tickets, it looks like a problem is introduced if you use -isystem to specify a directory that gcc would already have considered as part of its default system include directories.  Doing so causes that particular directory to be moved up earlier in the search order, so the internal use of #include_next ends up failing because it is relying on the "known" order of the default system include directories.  Note that this is not a problem with the -I flag, because gcc will ignore the -I flag if the provided directory is in the default search path.  It's only -isystem that might rearrange the order of default directories.

Here is another ticket in the GCC tracker for this issue, marked WONTFIX: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129.  The recommendation is to not use -isystem for directories that gcc already includes in the default search path.

It's not clear to me that the specific use of -isystem introduced in this patch would violate this assertion.  Are there configurations for buildroot where "$(HOST_DIR)/usr/include" can resolve to a default include directory as listed in https://gcc.gnu.org/onlinedocs/cpp/Search-Path.html ?  It's not possible for my particular use, but I don't know all the uses of buildroot well enough to make that statement in the blanket general case.

However, I still very much appreciate the overall point you make - that use of the flag can cause subtle and unintended consequences.  If the maintainers choose to back the patch out, I can find another way to resolve my original issue by submitting a patch to u-boot to ensure it prefers its modified copy of libfdt.h instead of the possibly-installed system copy.  I still believe the use of -isystem here is correct in a strict technical sense, because "$(HOST_DIR)/usr/include" is truly a system include directory at a non-standard location.  But I understand that some packages incorrectly assume that -I is the only way to add include paths and don't anticipate the use of -isystem.  Case in point, the Python package I just submitted a patch for.

Cheers,
David
