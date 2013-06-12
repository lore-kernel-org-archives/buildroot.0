From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Jun 2013 22:54:42 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: Add upstream patch to avoid
	occasional mdev SIGSEGV.
In-Reply-To: <201306120825.03217.rasasi78@gmail.com> (=?utf-8?Q?=22Ra?=
 =?utf-8?Q?=C3=BAl_S=C3=A1nchez?= Siles"'s
 message of "Wed, 12 Jun 2013 08:24:58 +0200")
References: <20130611162412.GE18264@trismegisto.universo>
 <871u884b4l.fsf@dell.be.48ers.dk>
 <201306120825.03217.rasasi78@gmail.com>
Message-ID: <877ghz2god.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ra?l" == Ra?l S?nchez Siles <rasasi78@gmail.com> writes:

Hi,

 >> I would prefer to not rename the existing patch, as it makes it less
 >> clear where it comes from (http://busybox.net/downloads/fixes-1.21.0/).
 >> 
 >> It shouldn't be necessary either as '.' comes before '_' (but not before
 >> '-').

 Ra?l>   That's not what I got here. I've done a more comprehensive test:
 Ra?l> $ ls -1 |sort 
 Ra?l> busybox-1.21.0-mdev_2_check_ACTION.patch
 Ra?l> busybox-1.21.0-mdev_check_ACTION.patch
 Ra?l> busybox-1.21.0-mdev-check_ACTION.patch
 Ra?l> busybox-1.21.0-mdev.patch

 Ra?l>   As you can see the one we want to apply first comes last
 Ra?l> compared with other possibilities :/

That's because localization is odd.

touch busybox-1.21.0-mdev_2_check_ACTION.patch busybox-1.21.0-mdev.patch

ls -1
busybox-1.21.0-mdev_2_check_ACTION.patch
busybox-1.21.0-mdev.patch

LANG=C ls -1
busybox-1.21.0-mdev.patch
busybox-1.21.0-mdev_2_check_ACTION.patch

We should arguably force LANG=C (or atleast LC_COLLATE, E.G. the sort
order) in apply-patches.sh so we always use the same sort order, I'll
fix that now.

 >> Talking of which, why is this patch not in the fixes directory? Does
 >> Denys not consider it important enough?

 Ra?l>   That's probably something to ask him. I found this bug by
 Ra?l> chance and I don't consider it critical in any way, altough I
 Ra?l> haven't explored further implications. This can be reproduced
 Ra?l> when you invoke mdev without parameters. It will SIGSEGV since,
 Ra?l> as per current 1.21.0 code, you'll check for ACTION environment
 Ra?l> variable, which doesn't exist. This means a null pointer which is
 Ra?l> passed to index_in_strings which, in turn, passes it to the
 Ra?l> uclibc strcmp function that is unable to handle this case
 Ra?l> gracefully.

Could you bring it up on the busybox list and suggest it gets added to 1.21-fixes, please?

-- 
Bye, Peter Korsgaard
