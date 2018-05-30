From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 May 2018 08:14:11 +0200
Subject: [Buildroot] get initial entropy from the host
In-Reply-To: <CO2PR01MB1976C4D602E26FDF0D121DEFCC6C0@CO2PR01MB1976.prod.exchangelabs.com>
 (Enoch W.'s message of "Wed, 30 May 2018 00:31:14 +0000")
References: <CO2PR01MB1976C4D602E26FDF0D121DEFCC6C0@CO2PR01MB1976.prod.exchangelabs.com>
Message-ID: <877enl4qmk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Enoch" == Enoch W <ixew@hotmail.com> writes:

 > Hi,?
 > Thanks for making Linux so easy to build [that is, when it works ;-) ]

You're welcome ;)

 > package/initscripts/init.d/S20urandom doesn't have readily available entropy on its first boot.
 > May I suggest initializing /dev/urandom from host generated
 > random-seed. I do it now via my board post-build.sh as follows.
 > IMHO it should be done as standard.

 > umask 077
 > dd if=/dev/urandom of=${TARGET_DIR}/etc/random-seed count=1

The problem is that if you have a lot of devices running the same build
they will have the same entropy. We used to have a hardcoded default
value for /etc/random-seed which we removed back in 2015:

commit ed0b44fdcecd2a703d2c1b8134375e19a2b7f867
Author: Baruch Siach <baruch@tkos.co.il>
Date:   Wed Jul 8 08:24:11 2015 +0300

    system/skeleton: remove random-seed

    Seeding the entropy pool with a known seed makes more harm than good. This is
    especially bad for when /etc is not on a persistent writable storage, so the
    entropy pool is seeded with the same value on every boot. Just drop it.

    Signed-off-by: Baruch Siach <baruch@tkos.co.il>
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

-- 
Bye, Peter Korsgaard
