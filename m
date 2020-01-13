From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jan 2020 18:20:33 +0100
Subject: [Buildroot] [PATCHv3] toolchain/external: allow custom
 toolchains to use newer headers
In-Reply-To: <20200113170959.1c7a901a@windsurf>
References: <20200107205429.11726-1-yann.morin.1998@free.fr>
 <20200113170959.1c7a901a@windsurf>
Message-ID: <20200113172033.GB28343@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-01-13 17:09 +0100, Thomas Petazzoni spake thusly:
> Thanks for this patch. I just needed it for an internal toolchain that
> I'm building with Buildroot 2019.02 (which supported headers 5.0
> maximum), but using Linux 5.4. So, the commit title that starts with
> "toolchain/external" is a bit incorrect as your implementation, as the
> commit log states, also addresses the case of internal toolchain.

Right, I'll update the commit title.

> Some more comments below.
> 
> On Tue,  7 Jan 2020 21:54:29 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > +	  If your kernel headers are more recent than the latest version
> > +	  in the choice, then select the latest version.
> > +
> >  config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4
> >  	bool "5.4.x"
> 
> We should probably change the prompt here to:
> 
> 	bool "5.4.x or later"
> 
> and make it an habit of moving this "or later" statement to the most
> recent kernel headers option. This is IMO clearer than just the
> additional statement in the help text.

I was a bit worried about the additional burden of updating the headers
versions here and there...

With the patch as proposed, the 'latest' semantic is located in a single
place, and there is a single 'select' to move around, in
toolchain/Config.in:560.

But I can change. The existing prompts will be visible in the diff
context, so should be easy to spot. Hopefully.

> >  BUILDDIR="${1}"
> >  SYSROOT="${2}"
> >  # Make sure we have enough version components
> >  HDR_VER="${3}.0.0"
> > +CHECK="${4}"  # 'strict' or 'loose'
> >  
> >  HDR_M="${HDR_VER%%.*}"
> >  HDR_V="${HDR_VER#*.}"
> > @@ -32,16 +48,19 @@ ${HOSTCC} -imacros "${SYSROOT}/usr/include/linux/version.h" \
> >  int main(int argc __attribute__((unused)),
> >           char** argv __attribute__((unused)))
> >  {
> > -    if((LINUX_VERSION_CODE & ~0xFF)
> > -        != KERNEL_VERSION(${HDR_M},${HDR_m},0))
> > +    int ret = 0;
> > +    int l = LINUX_VERSION_CODE & ~0xFF;
> > +    int h = KERNEL_VERSION(${HDR_M},${HDR_m},0);
> > +
> > +    if(l != h)
> >      {
> >          printf("Incorrect selection of kernel headers: ");
> >          printf("expected %d.%d.x, got %d.%d.x\n", ${HDR_M}, ${HDR_m},
> >                 ((LINUX_VERSION_CODE>>16) & 0xFF),
> >                 ((LINUX_VERSION_CODE>>8) & 0xFF));  
> > -        return 1;
> > +        ret = ((l >= h ) && ("${CHECK}"[0] == 'l')) ? 0 : 1;
> 
> No space before the parenthesis after "h".

Yeah. typo.

> Also, checking just the
> first letter of ${CHECK} seems like a hack. Why not:
> 	ret = ((l >= h) && !strcmp("${CHECK}", "loose")) ? 0 : 1;

Can do. Done.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
