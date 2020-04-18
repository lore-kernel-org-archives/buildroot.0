From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Apr 2020 12:01:34 +0200
Subject: [Buildroot] [PATCH 1/4] package/openjdk: fix hash
In-Reply-To: <20200417232922.3762195-1-aduskett@gmail.com>
References: <20200417232922.3762195-1-aduskett@gmail.com>
Message-ID: <20200418120134.0a54a287@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 17 Apr 2020 16:29:19 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> The hash should be
> 6815dbac7dd0f86291254e84ed17565c89477eeb6b0847a9648b00ecb4f07634

No, the hash was
6815dbac7dd0f86291254e84ed17565c89477eeb6b0847a9648b00ecb4f07634, and
it is now
fcd13ebd63d40c1c2f3cabfb7bc368962ff7b5935523be2a0e769352987145ae.

But still, why do you fix hashes like that, without investigating at
least a little bit what's going on? How come we committed a wrong hash?
How come there are no build failures related to this incorrect hash?

If you look at
http://autobuild.buildroot.net/results/0a4/0a4608828365df301114b533d6b59a4733599d94/build-end.log,
you will see why:

 - We download from the original upstream location, and indeed the hash
   of the upstream tarball is
   fcd13ebd63d40c1c2f3cabfb7bc368962ff7b5935523be2a0e769352987145ae,
   but we expect
   6815dbac7dd0f86291254e84ed17565c89477eeb6b0847a9648b00ecb4f07634

 - So we fallback to sources.buildroot.net, and here the tarball has
   the expected hash, i.e
   6815dbac7dd0f86291254e84ed17565c89477eeb6b0847a9648b00ecb4f07634

So this means that:

 (1) Upstream changed the contents of their tarball, which is really
     BAD and we want to understand what are the changes. So you should
     diff the new upstream  tarball, and the tarball that we have in
     sources.buildroot.net and investigate the differences.

 (2) We need to notify upstream that this is really bad.

 (3) You can't change the hash just like this, because it would mean
     that the hash would no longer match with the tarball we have
     backed up on sources.buildroot.net.

If we have hashes, it's not to blindly update them. We have hashes
precisely to detect that kind of situation, so if you blindly update
the hashes without doing any investigation, it makes it completely
useless to have hashes.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
