From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 06 Nov 2012 23:32:37 +0100
Subject: [Buildroot] [PATCH] BR2_PREFER_STATIC_LIB and LDFLAGS+= -static
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C628B69F@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C628A986@ex-mb1.corp.adtran.com>
 <50984D57.3080402@mind.be>
 <F9C551623D2CBB4C9488801D14F864C628B69F@ex-mb1.corp.adtran.com>
Message-ID: <50999005.1020002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/12 16:06, ANDY KENNEDY wrote:
>> >     Although I'm OK with this patch, I have been unable to reproduce the problem
>> >  and I'd like to know why it is going wrong with -static.  Can you post a
>> >  defconfig that I can rebuild and that exposes the problem?
>> >
>> >     Note: a few autobuilders with BR2_PREFER_STATIC_LIB enabled could be nice -
>> >  or maybe not, because many packages _will_break.
>> >
>> >     Regards,
>> >     Arnout
> First off, I built again with a clean copy of BuildRoot (2012.08) and
> produced this output this time:
>
> root at akennedy_lin:~/deleteme/buildroot-2012.08#  find output/target/ \
> -exec file {} \; 2>&1 | grep dynamic | awk -F: '{print $1}'
> output/target/usr/bin/ldd
> output/target/usr/bin/htop
> output/target/usr/bin/getconf
> output/target/usr/sbin/kdump
> output/target/usr/sbin/proftpd
> output/target/sbin/ldconfig

  I finally understand what's going on - it's exactly what Andy said in his
first mail :-)

  libtool interpret -static as linking statically with libraries that will not
be installed to the libdir; you have to pass it -all-static to force static
linking.  Or, as Andy proposes, pass --static, which libtool passes on blindly
to gcc.  gcc and (GNU) ld both interpret --static the same as -static (although
this isn't documented).

  Therefore, this gets my
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
