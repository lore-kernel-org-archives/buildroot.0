From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Mar 2017 00:03:57 +0100
Subject: [Buildroot] [PATCH] support/script/check-bin-arch: ignore
 /usr/share
In-Reply-To: <87efxpj8bv.fsf@dell.be.48ers.dk>
References: <1490128516-31437-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87inn1k9bb.fsf@dell.be.48ers.dk>
 <20170322140639.5c8c5149@free-electrons.com>
 <87efxpj8bv.fsf@dell.be.48ers.dk>
Message-ID: <2219b1bf-ae08-5c54-5f18-6a91e9f975ba@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-03-17 22:43, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Hello,
>  > On Wed, 22 Mar 2017 09:24:56 +0100, Peter Korsgaard wrote:
> 
>  >> http://autobuild.buildroot.net/results/4e2/4e27559827f3ed75a12f13bd595998bf661b2aaf/build-end.log
>  >> http://autobuild.buildroot.net/results/99e/99e4ed21116c721faf9f1d0349f312b357d333ee/build-end.log

 Looks like the regexes in the script are all wrong: they match against
./something, but the file names are /something.

 Ah, that's Yann's doing: when moving the pkg_files to the while read loop, he
sneaked in the removal  of the initial . - without mentioning it in the commit
log. Tsk tsk.


>  >> I wonder if we shouldn't turn the tests around, E.G. instead of
>  >> searching for elf files with a machine different from target, search for
>  >> a files with machine == host.

 I don't agree. We don't only want to detect host-target confusion, we also want
to detect wrong compilation, e.g. missing -EB.

 By the way, we shouldn't be afraid to exclude files and directories. Take for
example /usr/share: some packages may actually install binaries there (e.g.
gstreamer installs a bash-completion helper there). However, all packages also
install something somewhere else, and it's very likely that if it does something
wrong, it's wrong everywhere.

 BTW, we should also manually check if there are no problems with the boot
loaders, which don't get triggered in the autobuilders...


>  > Indeed, that's an option. We would need to have only the readelf
>  > machine string for the most common build architectures (x86, x86-64),
>  > and if Buildroot is used on a different architecture, we simply don't
>  > do the check.
> 
> Exactly, or alternatively we run readelf on a host utility (E.G. HOSTCC)
> to detect the machine string.
> 
> 
>  >> This can naturally still fail if somebody adds a package (E.G. in
>  >> br2-external) that installs a i386/x86-64 binary. Presumably this could
>  >> happen if you want to include a PC application to inside the firmware
>  >> (E.G. downloadable through the web interface and used for controlling
>  >> the firmware or similar), but it doesn't get caught up in all these
>  >> build issues about various other firmware files or slightly different
>  >> machine strings (sparc / sparcv9, arcompat / arcv2)..
> 
>  > I must say I still like the fact that we detect sparc vs. sparcv9,
>  > arcompat vs arcv2. I.e why do we have some binaries that have a
>  > different machine number than most of the binaries being produced?
> 
> Sorry, I don't know enough details about Sparc and Arc. It indeed seems
> strange.
> 
> 
>  > But I agree it's of limited usefulness, so if you want me to change the
>  > mechanism by inverting the logic, I can cook some patches.
> 
> Well, just like for all other BR features I want to ensure that the
> complexity/gain relation is OK. If we need to add more and more
> exceptions and perhaps more complicated/fuzzy matching to handle these
> machine string variantions then I think it would make sense to invert
> the test to simplify - But lets see how it goes.

 Indeed, if it becomes too complicated we have to find a simpler approach.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
