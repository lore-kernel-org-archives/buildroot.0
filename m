From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 19 Feb 2019 19:35:53 +0100
Subject: [Buildroot] minicom aborts
In-Reply-To: <03499d6b-bd94-b080-f5a9-53e6e0422e78@gmx.com>
References: <trinity-76e60e04-b256-49e6-9a96-952ff2003124-1550502581474@3c-app-mailcom-bs08>
 <20190218204417.5c943e3c@gmx.net>
 <03499d6b-bd94-b080-f5a9-53e6e0422e78@gmx.com>
Message-ID: <20190219193553.21e11bc2@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Tue, 19 Feb 2019 12:26:43 +0100, David Picard <dplamp@gmx.com> wrote:

> Hello,
> 
> Le 18/02/2019 ? 20:44, Peter Seiderer a ?crit?:
> > Hello David,
> >
> > On Mon, 18 Feb 2019 16:09:41 +0100, "David PICARD" <dplamp@gmx.com> wrote:
> >  
> >> Hello,
> >>   
> >> When I try to start minicom, some test fails, and minicom quits straight away :
> >>
> >> # minicom
> >> minicom: minicom.c: 1041: test_mbswidth: Assertion `mbswidth(e[i].s) == e[i]._mbswidth || mbswidth(e[i].s) == e[i]._mbswidth_kaputt' failed.
> >> Aborted
> >>   
> >> The minicom.c file can be found here :
> >> https://salsa.debian.org/minicom-team/minicom/blob/master/src/minicom.c
> >>   
> >> My only locale is "C".
> >>   
> >> I'm not sure if it's a bug in minicom or if something is missing on my system.  
> > Try to run with enabled printf debug output:
> >
> > 1038      if (0)
> > 1039         printf("%d: mbswidth=%zd\n", i, mbswidth(e[i].s));
> > 1040       assert(mbswidth(e[i].s) == e[i]._mbswidth
> > 1041 	     || mbswidth(e[i].s) == e[i]._mbswidth_kaputt);
> >
> > And take a look which test fails with which value...  
> So I put "if (1)" in line 1038. The test that failed was the 1st. So I 
> commented out the lines with Asian characters at the beginning of the 
> function, but it still failed. Finally, I put a "return" statement at 
> the beginning of the function, and now it works.

I can confirm minicom (without modifications) needs an UTF8 enabled locale
(e.g. LANG=en_US.utf8) to run without the assert...

The function mbswidth() is implemented in common.c ([1]), using
mbstowcs()....

Regards,
Peter

[1] https://salsa.debian.org/minicom-team/minicom/blob/master/src/common.c#L117

> 
> I attached my defconfig.
> >
> > And share your .config/defconfig file...
> >
> > Regards,
> > Peter
> >     
> >>   
> >> - David
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot  
> 
