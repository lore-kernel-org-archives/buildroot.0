From: Asaf Kahlon <asafka7@gmail.com>
Date: Thu, 19 Mar 2020 15:53:23 +0200
Subject: [Buildroot] [PATCH v6 18/28] package/cmake: Fix for using -O in
 top-level make
In-Reply-To: <20200319134951.3f8dfb85@windsurf.home>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-19-anaumann@ultratronik.de>
 <20200311232503.0bafe189@windsurf>
 <33267645-fd49-cb20-bb8f-f6a1edd57a15@mind.be>
 <d6125560-ca00-a4be-cfde-ff200d332756@andin.de>
 <20200317070800.6365cac6@windsurf.home>
 <CALFsTFUiXLAVUPaKE22FZE7sF2V4uhv6XmDyim0-cveKP950mA@mail.gmail.com>
 <0172c8d6-c39a-10a4-cb03-839242936287@andin.de>
 <CALFsTFVHh+K0_9Un4Gx1TKVi1HwoDqG7N=gvMgdVxpN5iB0vyQ@mail.gmail.com>
 <6e936a94-ca1a-dce4-cae5-40605344119b@andin.de>
 <CALFsTFVNjnov69twmk_kv6VdBQAkLXTG4MaFUzw6LfiW2VmgDA@mail.gmail.com>
 <20200319134951.3f8dfb85@windsurf.home>
Message-ID: <CALFsTFUN-zHap9eg2AVoeVCH+5Yw3gF3SPZNx9rOFRtwtvUeLw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, Mar 19, 2020 at 2:49 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Thu, 19 Mar 2020 13:40:36 +0200
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > > To me it seems like this could be the culprit. The question is, what
> > > should we do with this? Check for Make version < 4.2 && -j && -O and
> > > give a warning? Maybe this is a bit too much.
> > We now check for make>4.0. Do we want to bump it?
> > Maybe some of the core Buildroot maintainers can give their advice here.
>
> We don't require make 4.0, we only require make 3.81.
>
> The logic in support/dependencies/check-host-make.mk to check for make
> 4.0 is only for those few packages that do need make >= 4.0. For such
> packages, if the version of make installed system-wide is < 4.0, then
> we build our own host-make. But the overall Buildroot build is still
> executed by the system-wide make, which may be < 4.0.

You're right, thanks for the correction.

>
> Requiring make > 4.0 on the host system is too strict, especially
> considering that the issue we have here only happens in very specific
> conditions: ccache support enabled, and passing of custom -O flags that
> are only useful for top-level parallel build, which is itself an
> experimental feature.

Just as a side note - the problem isn't related to ccache. We
reproduced it with -O
and top-level parallel build.
In addition, if you have any suggestion how to address that case -
I'll be more than happy
to help.

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Asaf.
