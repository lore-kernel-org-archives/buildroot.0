From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Aug 2015 17:09:03 +0200
Subject: [Buildroot] [PATCH] package/dropbear: fix when readlink is
	busybox'
In-Reply-To: <1439925953-5345-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Tue, 18 Aug 2015 21:25:53 +0200")
References: <1439925953-5345-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87pp2czptc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Busybox' "readlink -f" does not canonicalise paths when the target is
 > missing, while coreutils do.

 > Fix that by:
 >   - making an absolute symlink
 >   - dropping "-f" when calling readlink

 > Fixes #8276.

Committed, thanks.

 > --- a/package/dropbear/S50dropbear
 > +++ b/package/dropbear/S50dropbear
 > @@ -18,7 +18,7 @@ start() {
 >  	#   - the filesystem is RW (i.e. we can rm the symlink),
 >  	#     replace the symlink with an actual directory
 >  	if [ -L /etc/dropbear \
 > -	     -a "$(readlink -f /etc/dropbear)" = "/var/run/dropbear" ]
 > +	     -a "$(readlink /etc/dropbear)" = "/var/run/dropbear" ]
 >  	then
 >  		if rm -f /etc/dropbear; then
 >  			mkdir -p /etc/dropbear

Looking at the recent changes to S50dropbear, isn't it quite noisy with
a RO rootfs? I would imagine those rm and mkdir calls complain with
RO. Perhaps we should add 2>/dev/null to them?

-- 
Bye, Peter Korsgaard
