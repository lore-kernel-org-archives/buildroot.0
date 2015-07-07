From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jul 2015 14:38:29 +0200
Subject: [Buildroot] [PATCH] fs/cpio: drop static random-seed
In-Reply-To: <20150707112809.GR3139@tarshish> (Baruch Siach's message of "Tue, 
 7 Jul 2015 14:28:09 +0300")
References: <b00f4e7c142fdff8a1f311de5816008b08b13e67.1436263286.git.baruch@tkos.co.il>
 <87fv50nrz6.fsf@dell.be.48ers.dk> <20150707112809.GR3139@tarshish>
Message-ID: <877fqcnnwa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

>> I agree, but why don't we simply drop our static /etc/random-seed from
 >> the default skeleton instead?

 > Good idea. /etc/random-seed is less harmful on persistent filesystems, as it 
 > only affects the first boot. But it probably doesn't do any good either.

Yes, but plenty of people use a readonly /etc, so they have the same
issue.

> In addition to that I think it would also be better not to use 
 > /etc/random-seed when the filesystem is read-only, even when that file exists. 
 > Currently /etc/init.d/S20urandom reads /etc/random-seed from a read-only 
 > filesystem, but doesn't write it, which seems just wrong.

 > What do you thing?

It was discussed recently:

http://lists.busybox.net/pipermail/buildroot/2015-March/121708.html

I think we should just remove the hardcoded seed file. If people have a
persistent RW /etc then S20urandom handles it, and otherwise it doesn't
do anything.

You can argue if it makes sense to update /etc/random-seed directly in
the start phase of the init script (as the system will not have a lot of
interesting entropy), but most systems probably don't get shut down
nicely, so the stop action never runs.

-- 
Venlig hilsen,
Peter Korsgaard 
