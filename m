From: Ulf Samuelsson <ulf@atmel.com>
Date: Sat, 9 Jun 2007 09:53:01 +0200
Subject: [Buildroot] Easier adding of new packages / alsa-lib & utils
References: <20070607132945.GC4224@firebird.dresden.micronet24.de><007501c7a995$663af6b0$0302a8c0@atmel.com>
	<20070608174728.GB4273@firebird.dresden.micronet24.de>
Message-ID: <016c01c7aa73$e6a6f1d0$0302a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> As I see it we lack three things in the build.
>> 1) Ability to use backup sites if the main site is temporarily or permanently down.
> To 1) The main problem, I think, is that somebody has to maintain these
> backup-addresses or to provide a backup-server containing all possibly
> needed files. The rest of the problem is easy, as it can be solved
> either by a scipt wrapping wget or by a File-downloading-rule caring
> about backup-locations
> 

I think buildroot should contain the mechanism to do it,
and the user should be able to provide a backup server location.
I have seen discussions where the conclusion is that if someone
wants to be compliant with GPL, then they need to provide the source
for everything, so everyone using buildroot in products
needs to provide their own backup server.


>> 2) Handling of distributions.    I.E. ability to specify which package version you 
>>     want to build in a way which is separated from the package build script.
> To 2) This is a more difficult problem since you have to give the user a
> chance to specify all supported versions. If you want to integrate it
> into the current configuration-process you would have to specify a field
> or list for every single package - Leaving the user alone with the
> decision of hundred of different versions.

As I envision the mechanism, you should be able to generate a file containing
all the current versions using a simple command.

I.E:     make distrib

Each package makefile fragment would contain.

<package>-distrib:
            echo <package>_VER    >> .distrib
---------------

The Config.in should have a configuration string which, if not empty,
the file, with the filename in the string should be included by Makefile
in the beginning.

---------------
The makefile fragment in each package should test if
<package>_VER is defined, and if not, it should define it.


Alternatively, you always have a configuration file containing the version info
and you either use this or you use your own,

I see the use of this functionality as a help for newbies, where people with more
experience select the package versions and create a distribution which are then used
by people less experience.,

> 
> According to the introduction, we would have enough up to here :)
> 

>> 3) Ability to generate binary packages which can be added/removed from 
>>     the root fs.
>> 
> To 3) You have something like this, even if it could be improved. If you
> "make package" the first time you build and install the package. If you
> afterwards do "make package-clean" you remove it from the rootfs. Doing
> "make package" again installs the stuff...
> 

But it requires that you have access to the package compile tree which is sometimes undesirable.



Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
