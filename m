From: =?UTF-8?Q?C=C3=A9dric_Marie?= <cedric.marie@openmailbox.org>
Date: Mon, 22 Jun 2015 16:22:41 +0200
Subject: [Buildroot] CMake and VERBOSE variable
In-Reply-To: <CAHXCMM+-eyJRSa5c8WAtqptC0MTbJNBb4bZdhBBaY3yxYvAauw@mail.gmail.com>
References: <9943347198fceae1227501e1d00f818a@openmailbox.org>
 <5578B394.1010503@mind.be>
 <a5c10080f12174d721c5f1ebad30b3f1@openmailbox.org>
 <5579E9EF.4070402@mind.be>
 <0d88f0bd848eeb62c868dc2d5dffe496@openmailbox.org>
 <55870F2F.4080700@mind.be>
 <4fd6c4c54bc90972d20b6f04b62b227e@openmailbox.org>
 <CAHXCMMJWjiKVCi-vjWftDgAxq7JDN+You3Go-NCvQVS81AC1Cw@mail.gmail.com>
 <7f746aa9c68a301002cdca28b6cb3f51@openmailbox.org>
 <CAHXCMM+-eyJRSa5c8WAtqptC0MTbJNBb4bZdhBBaY3yxYvAauw@mail.gmail.com>
Message-ID: <0494936f4284565201a58a70d0a3c08d@openmailbox.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 2015-06-22 13:57, Samuel Martin a ?crit?:
>> No, you can still build with "make VERBOSE=1" and CMake will take it 
>> into
>> account.
> 
> Not really convenient :(
> AFAICS, VERBOSE is not an official env. var. altering Buildroot's
> behavior, unlike V [1].
> 
> If VERBOSE should only be set for cmake-based package, in addition to
> globally unexport it, I'd prefer:
> - either fix the cmake infra to keep the same behavior from the user
> point of view;
> - or update the doc.
> 
> I prefer the 1st option.


I guess you're right. I was not aware of that.

Please note that the first patch will not remove the export of VERBOSE. 
It will export it only if V is set.
The patch proposed by Arnout was:

  ifeq ($(KBUILD_VERBOSE),1)
    quiet =
    Q =
  ifndef VERBOSE
    VERBOSE = 1
  endif
+export VERBOSE
  else
    quiet = quiet_
    Q = @
  endif

Which means that you can still enable CMake verbose mode with "make 
V=1".


In the second patch, we are planning to remove: quiet Q KBUILD_VERBOSE 
VERBOSE
It would be possible to keep VERBOSE (and export it only if V is set), 
but I agree that it would make more sense to turn V into VERBOSE in 
cmake-infra, since it is CMake specific, and CMake does not understand 
V.

But then, what about autotools?
V is supposed to be taken into account by autotools, but I can't see no 
difference with V=0 or V=1, even when forcing it in <pkg>_BUILD_CMDS. 
(Checked with gdb for example).



> I think it is intentional (given [2] and the number of occurences of
> "\<VERBOSE\>" in the cmake code base ;-]).

What I suggested to be non-intentional is the empty VERBOSE case, which 
produces only the "dependee" messages.
I have already contacted CMake dev team about that, but I couldn't get a 
clear answer for the empty VERBOSE case.
The discussion is here, I have pointed out the source code that was 
responsible for that behaviour (see the last message of the discussion):
http://www.cmake.org/pipermail/cmake/2014-February/056943.html


-- 
C?dric
