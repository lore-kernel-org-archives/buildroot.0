From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Dec 2019 23:24:11 +0100
Subject: [Buildroot] [PATCH] package/busybox/udhcpc.script: fix network
 interface tag comments
In-Reply-To: <20191208233756.GA30928@fifth.space>
References: <20191208233756.GA30928@fifth.space>
Message-ID: <20191225232411.3645a98c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Quentin,

On Mon, 9 Dec 2019 00:37:56 +0100
Quentin Rameau <quinq@fifth.space> wrote:

> Per Linux man-pages resolv.conf(5): "Lines that contain a semicolon (;)
> or hash character (#) in the first column are treated as comments."

Thanks a lot for your patch! Could you resend it with a "Signed-off-by"
tag with your name/e-mail at the end of the commit log?

Also, I think the commit log should be a bit more verbose, as it took
me some time to reconstruct what is the problem that you're trying to
solve.

A better commit log is probably:

"""

Commit 584f418ec1ae3f0b5e09c10133c82578d78a3e03 ("busybox:
udhcpc.script: fix resolv.conf handling with multiple interfaces")
added some logic in udhcpc.script to "tag" the lines in resolv.conf
according to the network interface they come from, in order to only
remove the relevant lines when an interface goes down.

Due to this, the resolv.conf file looks like this:

nameserver 1.1.1.1 # eth0
nameserver 2.2.2.2 # eth1

However, resolv.conf(5) states that:

       Lines that contain a semicolon (;) or hash character (#) in the first column are treated
       as comments.

So, it seems like comments starting in the middle of the line are not
standard. This commit changes the logic in udhcpc.script to put the
network interface "tag" and the nameserver directive on two separate
lines:

# eth0
nameserver 1.1.1.1
# eth1
nameserver 2.2.2.2

and adjust the logic to delete the appropriate lines when the interface
goes down.
"""

It would be even better if you could describe if you noticed a
practical problem with this. In the commit from 2013, the author (Peter
Korsgaard) said he checked the glibc and uClibc implementation. Did you
encounter a problem with the musl C library ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
