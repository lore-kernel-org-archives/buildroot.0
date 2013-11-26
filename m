From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 26 Nov 2013 23:11:22 +0100
Subject: [Buildroot] still trusting ccache ?
In-Reply-To: <DD0F4606257B467E8A4CA405E36B5548@JohanW7>
References: <DD0F4606257B467E8A4CA405E36B5548@JohanW7>
Message-ID: <52951C8A.5030603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/11/13 22:13, Sagaert Johan wrote:
>
> Hi all;
>
> Last weekend I had an strange build error building libglib when ccache was enabled:
> (something thread related)
>
> - A clean build with ccache on  -> Failed
> - A clean build with ccache off -> Ok
> - Deleted the whole buildroot-ccache directory tree
> - A clean build with ccache on -> Ok !!

  Is it possible that you changed compiler? We have disabled hashing the 
compiler in ccache about a year ago, but the result of that is that the 
cached results are wrong when you switch to a different compiler.

  One big problem is that in the current situation, changing the compiler 
isn't even detected if you switch output directory. Fortunately, ccache 
still hashes the basename of the compiler, so when you switch 
architectures, ccache will not use the wrong object files.

  There has been a discussion about this a couple of weeks ago [1] so the 
situation will hopefully change again in the near future.

[1] http://lists.busybox.net/pipermail/buildroot/2013-November/083028.html


> In my build I only gain 3 minutes (10%) in time.

  If you don't gain anything, there's certainly no point to use ccache of 
course. Other people have reported much larger gains.


> I have some doubts on trusting ccache after this experience.
>
> So I think that some un-reproducable build errors could be ccache related as well.

  I don't think that any of the autobuilders use ccache. Though perhaps 
they should, so we would detect these problems. But at the moment it 
wouldn't be a good idea because we know it would fail :-)

>
> PS I noticed that besides .buildroot-ccache there is also a .ccache created when building.

  Hm, that's strange...


  Regards,
  Arnout

>
> Regards
> Sagaert Johan
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
