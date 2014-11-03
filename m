From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Nov 2014 21:54:44 +0100
Subject: [Buildroot] [git commit] avahi: fix avahi-ui build with libgtk3
In-Reply-To: <1415008511.2065.2.camel@posteo.de>
References: <20141031115353.56D52B23C4@busybox.osuosl.org>
 <1414799165.15213.1.camel@posteo.de> <20141101191304.GG10189@free.fr>
 <1415008511.2065.2.camel@posteo.de>
Message-ID: <5457EB94.8090005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/14 10:55, J?rg Krause wrote:
> Yann, Peter,
> 
> On Sa, 2014-11-01 at 20:13 +0100, Yann E. MORIN wrote:
>> J?rg, All,
>>
>> On 2014-11-01 00:46 +0100, J?rg Krause spake thusly:
>>> On Fr, 2014-10-31 at 12:50 +0100, Peter Korsgaard wrote:
>>>> commit: http://git.buildroot.net/buildroot/commit/?id=e6c04e6daae674f8983ec2fb106fb897c6803c32
>>>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>>>
>>>> Fixes:
>>>> http://autobuild.buildroot.net/results/daa/daad247db16818f25ab33402e26e27257defbe13/
>>>> http://autobuild.buildroot.net/results/720/720e2c8a5eab8b47d2510fe03b4a90ec8beafc17/
>>>> http://autobuild.buildroot.net/results/02b/02b4ab9ee07707ee4a4d4ea2b9c67bee91b1392d/
>>>> http://autobuild.buildroot.net/results/819/81914317ce82dc1321484d8c2b65647f92aa6929/
>>>>
>>>> And many others.
>> [--SNIP--]
>>> This patch breaks building avahi for me. Is autoreconf really intended?
>>> Removing it fixed my build.
>>>
>>>         >>> avahi 0.6.31 Autoreconfiguring
>> [--SNIP--]
>>>         configure.ac:419: error: possibly undefined macro:
>>>         AM_GLIB_GNU_GETTEXT
>>>               If this token and others are legitimate, please use
>>>         m4_pattern_allow.
>>
>> It seems it requires gettext.
>>
>> J?rg, care to test adding this to avahi.mk (just below AUTORECONF):
>>
>>     AVAHI_GETTEXTIZE = YES
> 
> I'd like to discuss some possibilities to solve this issue:
> 
> 1) forget about patching Makefile.am / running
> autoreconf and just strip the CFLAGS arguments in Makefile.in as Peter
> suggested

 I think this one is the most practical. Patching the .am is generally better
because then it's upstreamable, but that's not relevant here.


> 2) replace AM_GLIB_GNU_GETTEXT by AM_GNU_GETTEXT([external]) and update
> gettext to a recent version (and maybe intltool too)

 Updating gettext/intltool is nice, but may have far-reaching effects...

 As to replacing AM_GLIB_GNU_GETTEXT, as far as I understand that was already
proposed upstream and rejected, so I don't think that's a good idea.


> 3) remove AM_GLIB_GNU_GETTEXT entirely and use only intltool
> (additionally update to recent version)

 Same consideration about upstream rejection.

> 4) add dependency on glib (or glib-gettext, if possible)

 That is certainly not nice - libglib2 takes a long time to build so if we can
avoid that...


 Regards,
 Arnout


> 
> My thoughts:
> 2) I'm not sure why glib version instead of gettext is used here. Maybe
> for historical reasons. In autogen this piece of code is used:
>         # Evil, evil, evil, evil hack
>         sed 's/read dummy/\#/' `which gettextize` | sh -s -- --copy
>         --force
> which uses GNU gettextize instead of glib-gettextize.
> 3) I've found some threads about conflicts of using intltool and gettext
> together, eg:
> https://mail.gnome.org/archives/gtk-devel-list/2012-September/msg00022.html
> [Quote] "intltool is a sort-of wrapper around xgetext which interferes
> with gettext's own way of setting up po/."
> 
> I've tested 2, 3, and 4 and all are building successfully. I've
> additionally checked if the .mo files are created in
> target/usr/share/locale/.
> 
> Best regards
> J?rg
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
