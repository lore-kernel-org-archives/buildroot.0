From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Nov 2015 00:22:08 +0100
Subject: [Buildroot] [PATCH 3/3] package/skeleton: ensure custom
	skeleton uses merged /usr if needed
In-Reply-To: <d667c39209bc260f60546ee0b9e7f5a661c4b761.1447190450.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 10 Nov 2015 22:36:30 +0100")
References: <cover.1447190450.git.yann.morin.1998@free.fr>
 <d667c39209bc260f60546ee0b9e7f5a661c4b761.1447190450.git.yann.morin.1998@free.fr>
Message-ID: <87d1vhphi7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > When using systemd, the poolicy in Buildroot is to use a merged /usr
 > (see c5bd8af6, "system: add options for /bin /sbin and /lib to be
 > symlinks into /usr" for more info). So, we apply a few tricks in some
 > packages to account for the merged /usr case.

 > However, when using a custom skeleton, we have no say in how that
 > skeleton is organised, so it may well have a split /usr. In that case,
 > our little tricks might not work as expected.

 > So, when the user uses a custom skeleton and wants systemd as an init
 > system, we must check that the custom skeleton is setup with a merged
 > /usr.

 > We do that by checking that each pair of {/lib,/usr/lib} {/bin,/usr/bin}
 > and {/sbin,/usr/sbin} have the same inode numbers, i.e. /lib must have
 > the same inode number as /usr/lib (and so on...). When a pair does not
 > share the same inode number, this is not a merged /usr and we abort.

 > We implement that check with make constructs, so it is done very early
 > in the build process, and we can abort early if need be.

Nice. It doesn't handle cases where absolute symlinks are used
(E.G. /bin -> /usr/bin), but I don't see how we can fix that.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
