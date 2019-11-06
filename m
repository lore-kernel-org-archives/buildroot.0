From: Matthew Weber <matthew.weber@collins.com>
Date: Wed, 6 Nov 2019 07:46:19 -0600
Subject: [Buildroot] [External] Re: [PATCH 1/1] package/domoticz: fix
 build with RELRO
In-Reply-To: <65074238-574a-e517-aa33-e137eb11f888@mind.be>
References: <20191031102306.15433-1-fontaine.fabrice@gmail.com>
 <20191031134302.685d1858@windsurf.home>
 <CAPi7W81G6kXj_ueiGDq2ocz_Q8HesGVDpp5g7BgXJ1qpqpu6WQ@mail.gmail.com>
 <20191104231237.1954d080@windsurf.home>
 <CANQCQpYQN5siLJi80xqbqbW81wncZ9mPhSojwWqdc66hDhoaOw@mail.gmail.com>
 <65074238-574a-e517-aa33-e137eb11f888@mind.be>
Message-ID: <CANQCQpY-s2ide2PaoM_e93EyXcF2ZWjd4Rjg352w_yF3B4+Hvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, Nov 6, 2019 at 7:07 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 05/11/2019 21:19, Matthew Weber wrote:
> > Thomas,
> >
> > On Mon, Nov 4, 2019 at 4:12 PM Thomas Petazzoni
> > <thomas.petazzoni@bootlin.com> wrote:
> >>
> >> Hello,
> >>
> >> I'm adding a few more people in Cc: Matt, Yann, Arnout, Peter.
> >>
> >> On Thu, 31 Oct 2019 14:01:33 +0100
> >> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> >>
> >>>> What is the relationship between using precompiled headers and relro
> >>>> build problems ?
> >>> I took me some time to understand the issue.
> >>> It seems that linker flag such as -Wl,-z,relro should not be used when
> >>> building a precompiled header.
> >>> I discovered this through this domoticz commit message:
> >>> https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_domoticz_domoticz_commit_68698e7a5dce80dea5a9b997d7e171b80bf566ac&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=DjIUeN2SXon2vr5dX4sl6rmhJvz5cmbRv5u_qS4doBw&s=ZPd1FlLwup8D1uVOQHfI-t-Whn2V55bYtrI9ZDYtrR4&e=
> >>>
> >>> However, this commit does not fix the issue on buildroot as
> >>> -Wl,-z,relro is not passed through CXXFLAGS but through our
> >>> toolchain-wrapper.
> >>> Updating toolchain/toolchain-wrapper.c to add the logic to manage
> >>> precompiled header seems more complicated than adding an option to
> >>> disable this feature from domoticz.
> >>
> >> So, I looked into this, found
> >> https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.fedoraproject.org_pipermail_devel_2011-2DJuly_153664.html&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=DjIUeN2SXon2vr5dX4sl6rmhJvz5cmbRv5u_qS4doBw&s=6ZTbPXMho6JGTlraCYmMM2nc_HlF9NsMkXyNc5GCgho&e=
> >> and https://urldefense.proofpoint.com/v2/url?u=https-3A__bugzilla.redhat.com_show-5Fbug.cgi-3Fid-3D718719&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=DjIUeN2SXon2vr5dX4sl6rmhJvz5cmbRv5u_qS4doBw&s=e_knYSAlNZ7WMHm6gZnbJn7Kj5mhCVIe5zWhgxkb23o&e= .
> >>
> >> So it really seems like -Wl,-z,relzo should not be passed when
> >> compiling. But our compiler wrapper passes it unconditionally when
> >> RELRO is enabled.
> >>
> >> Do we have a way to detect that the wrapper is called to compile or to
> >> link ? I don't think we do.
> >
> > Looks like we can just key on -xc-header or -xc++-header and
> > selectively enable the RELRO flags.  I'll do some builds and then send
> > a patch if that looks ok.
> >
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__pastebin.com_XGc8bFxh&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=DjIUeN2SXon2vr5dX4sl6rmhJvz5cmbRv5u_qS4doBw&s=5sBtnwkv13zwuv2FZm1hYBGap0wC14KeSXkljxL8JtQ&e=
>
>  I'm not so sure if that is a generic solution... As explained in [1]:
>
> $ gcc -o /tmp/stdio.gch /usr/include/stdio.h
> $ gcc -c -o /tmp/stdio.gch /usr/include/stdio.h -Wl,-z,relro
> $ gcc -o /tmp/stdio.gch /usr/include/stdio.h -Wl,-z,relro
> /usr/bin/ld: /usr/lib/gcc/x86_64-redhat-linux/9/../../../../lib64/crt1.o: in
> function `_start':
> (.text+0x24): undefined reference to `main'
> collect2: error: ld returned 1 exit status
>
>  The problem AFAICS is that if no -c or similar option is given, GCC decides
> what needs to be done based on the rest of the arguments. If the rest of the
> arguments include a -Wl,... option, it decides that linking needs to be done. If
> the rest of the arguments are just header files, it decides to create a
> precompiled header.
>
>  I think a more appropriate solution is to patch domoticz to add the -c option
> for building precompiled headers, which AFAICS should fix the issue.
>
>  If we want to fix it at the toolchain level, I think it would be more
> appropriate to handle it the way most distros do: by patching the spec file.

Agree, the little bit of testing I did ended up at the conclusion of
[1] where GCC infers a direction to take.

I believe the last time we looked at doing a custom spec file we
instead choose the wrapper path.    However I'd be curious how often
this will show up as it would be easier to patch domoticz and the
couple other packages for now.

>
>  Regards,
>  Arnout
>
>
> [1] https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.fedoraproject.org_pipermail_devel_2011-2DJuly_153864.html&d=DwICaQ&c=ilBQI1lupc9Y65XwNblLtw&r=y1sOV0GV8NZUkffv7oCRxs2Sd3nOBS-NxDM3NY8lOgs&m=DjIUeN2SXon2vr5dX4sl6rmhJvz5cmbRv5u_qS4doBw&s=h1AFIQjg3Krsi6JqWc3h0L83OT887ET8xVrRdcoBNqg&e=
