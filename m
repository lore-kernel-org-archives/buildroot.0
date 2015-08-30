From: =?UTF-8?B?Q8OpZHJpYyBNYXJpZQ==?= <cedric.marie@openmailbox.org>
Date: Sun, 30 Aug 2015 22:27:39 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <55D9016F.5080602@mind.be>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be> <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
 <5579E9EF.4070402@mind.be> <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
 <55870F2F.4080700@mind.be> <4fd6c4c54bc90972d20b6f04b62b227e@openmailbox.org>
 <CAHXCMMJWjiKVCi-vjWftDgAxq7JDN+You3Go-NCvQVS81AC1Cw@mail.gmail.com>
 <7f746aa9c68a301002cdca28b6cb3f51@openmailbox.org>
 <CAHXCMM+-eyJRSa5c8WAtqptC0MTbJNBb4bZdhBBaY3yxYvAauw@mail.gmail.com>
 <0494936f4284565201a58a70d0a3c08d@openmailbox.org>
 <ae20692cc561152ac16a33820206a599@openmailbox.org> <55D9016F.5080602@mind.be>
Message-ID: <55E3673B.40804@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 23/08/2015 01:10, Arnout Vandecappelle a ?crit :
>> When V=1, we should export Q = (empty) and a new variable BR2_VERBOSE = 1.
>> When V=0, we should export Q = @ and BR2_VERBOSE = (empty).
>
>   I don't think we should export anything at all, we should really do it per
> build system (which is problematic for generic-package of course).

You're right for Q. It is used in pkg-generic.mk, and should be defined 
only in this file, depending on V value and origin.

The benefits to exporting a new variable BR2_VERBOSE, is that we can 
check V value (0 or 1) and origin ("command line"?) only once, instead 
of repeating this double test in every .mk.

So now, thanks to your remarks, I've got something that is working for 
cmake and autotools.

* I have removed these exports from root Makefile: quiet Q KBUILD_VERBOSE.

* In pkg-generic.mk, I define Q=(empty) if V=1 from the command line, 
and Q=@ otherwise.

* In pkg-cmake.mk, I add "VERBOSE=1" in build command when V=1 from the 
command line.
(checked with libcuefile)

* In pkg-autotools.mk, I add "V=1" in build command when V=1 from the 
command line (and "V=0" otherwise, because V=1 is the default).
(checked with libpthsem)
NB: It would not even be necessary to modify pkg-autotools.mk, if V=0 
was the default.

I think that these modifications keep the behaviour unchanged.

Can I provide a patch with that?

Do you prefer to check V value and origin in all pkg-*.mk, or should I 
use BR2_VERBOSE to compute it once?

Waiting for your feedback,
Regards.

-- 
C?dric
