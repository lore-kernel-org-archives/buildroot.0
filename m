From: Andreas Naumann <dev@andin.de>
Date: Mon, 11 Mar 2019 12:16:32 +0100
Subject: [Buildroot] [PATCH 0/2] ppsh compatible Qt5 configuration
In-Reply-To: <20190310160630.GD25009@scaer>
References: <20190309141022.13140-1-anaumann@ultratronik.de>
 <20190309152204.38e20094@windsurf> <20190310160630.GD25009@scaer>
Message-ID: <1719bf3c-dd62-5321-cf74-92f0ee2ff97a@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Yann,...

Am 10.03.19 um 17:06 schrieb Yann E. MORIN:
> Thomas, All,
> 
> On 2019-03-09 15:22 +0100, Thomas Petazzoni spake thusly:
>> On Sat,  9 Mar 2019 15:10:20 +0100 Andreas Naumann
>> <anaumann@ultratronik.de> wrote:
>> 
>>> you were asking for ideas on "Making the Qt5 packaging compatible
>>> with per-package folder". Lately I had some time to look into it
>>> and came up with the following patches. Basically they use a
>>> custom qt.conf to manipulate qmakes builtin pathes. Details are
>>> in the commit-messages.
>>> 
>>> I did a compile test with almost all qt5 modules available, as
>>> well as other buildroot provided qt5 applications. At the moment
>>> I dont have equipment for runtime tests. As far as I could see
>>> the install procedure now works as expected, no more failures. 
>>> Unfortunately webengine and webkit-example failed sometime during
>>> the build but it seems that these were unrelated issues.
>> 
>> Thanks a lot for looking into this!
>> 
>> However, there is one thing that this doesn't seem to address: the 
>> installation part.
>> 
>> Currently, the staging installation is just:
>> 
>> make install
>> 
>> with no DESTDIR/INSTALL_ROOT, and therefore for the target 
>> installation, we have to manually install libraries, QML files and 
>> other stuff, which is really annoying to maintain. Ideally, we
>> would like Qt5 to behave like most other packages, and do:
>> 
>> make INSTALL_ROOT=$(STAGING_DIR) install
>> 
>> for the staging installation, and:
>> 
>> make INSTALL_ROOT=$(TARGET_DIR) install
>> 
>> for the target installation. This change is not strictly needed
>> for per-package host/target directories, but I really would like to
>> take the opportunity of changing all this Qt5 logic to also address
>> this related problem.

thank you for your feedback. I totally understand the issue and would of
course also like to reduce the maintenance burden.
Now, I have also fiddled with extprefix and found out, just like you,
that we can't really use INSTALL_ROOT without additional, more or less
hacky, fixups.

Looking for a simpler solution, I had one more idea with extprefix, that
is to set it to e.g. .../sysroot_qtonly/usr and install everthing there
as part of the build step. The staging-/target-install steps would then
just copy everything from the extprefix path to their respective
locations. This should avoid littering staging/target with host files.

Some local tests indicate that this could be implemented even without
explicitely setting extprefix but using the SysrootifyPrefix=false
setting in our custom qt.conf. That would allow to apply the solution
for the per-package use case (without reworking the Makefiles).
However...

> 
> I still believe a long-term goal would be to actually only ever
> install everything in staging, and generate target right at the end
> as a copy from staging as a starting point for all the cleaning we
> already do in target-finalize.

... the QT install step copies a lot of files  that we don't need in
target. Cleaning them and "forgetting" to maintain what to clean during
version bumps, could lead to useless stuff accumulating in target.
Personally I'm more fond of positive lists, because it creates a more
minimal-by-default policy. However, if it is decided to "shoot first and
ask questions later :-)" I'm happy to try a v2 in that way.


That is, for Qt5 only. Doing this in a generic way for all packages
sounds like a pretty demanding task.


Regards,
Andreas



> 
> This would have nicely worked-around this issue.> Regards, Yann E.
> MORIN.
> 
>> I had prepared something like this: 
>> https://github.com/tpetazzoni/buildroot/commit/05e776abf531319a749f5a7d65f265979ea6c4ab,
>>
>> 
but I don't remember if it was working completely or not.
>> 
>> Thanks,
>> 
>> Thomas -- Thomas Petazzoni, CTO, Bootlin Embedded Linux and Kernel
>> engineering https://bootlin.com 
>> _______________________________________________ buildroot mailing
>> list buildroot at busybox.net 
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
