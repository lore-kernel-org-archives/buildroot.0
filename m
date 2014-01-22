From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 22 Jan 2014 10:13:42 -0300
Subject: [Buildroot] [PATCHv2] e2fsprogs: Install libraries to staging
In-Reply-To: <20131128192305.154ec187@skate>
References: <1385661237-13975-1-git-send-email-daniel.nystrom@timeterminal.se>
 <20131128192305.154ec187@skate>
Message-ID: <52DFC406.8080504@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/28/2013 03:23 PM, Thomas Petazzoni wrote:
>> +E2FSPROGS_INSTALL_STAGING = YES
>> +E2FSPROGS_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install-libs
> 
> I must say I'd like to know *why* the normal "install" rule does not
> install the .pc file. It seems to install everything else, including
> the libraries, but not the .pc file, for some reason.

Fair enough, when calling install in the toplevel Makefile.in calling
install-libs has some conditions:

if test ! -d e2fsck && test ! -d debugfs && test ! -d misc && test ! -d
ext2ed ; then $(MAKE) install-libs ; fi

Since those directories exist install-libs is never called internally,
just install-shlibs-recursive which doesn't install the pc files.

My $.02 guess is that rule was written for e2fsprogs-libs which is the
recommended way to get the libs (blkid/et/quota/ss/uuid) since it lacks
those directories and has the same condition on the toplevel Makefile.in

It might be worth analyzing if we want to split, some distros do it that
way and it would reduce build times a bit in some scenarios.

Regards.
