From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Tue, 1 Oct 2013 16:30:05 -0500
Subject: [Buildroot] [PATCH 1/1] omniorb: cleanup autobuild failure,
 CFLAGS issue
In-Reply-To: <524B3391.5020907@mind.be>
References: <1380311674-6883-1-git-send-email-mlweber1@rockwellcollins.com>
 <524AF88C.4070906@mind.be>
 <OF8984387D.63FADA60-ON86257BF7.006A9834-86257BF7.006B779D@rockwellcollins.com>
 <524B3391.5020907@mind.be>
Message-ID: <OF638BF0DD.15C37E32-ON86257BF7.0072808D-86257BF7.00761C7B@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle <arnout@mind.be> wrote on 10/01/2013 03:41:53 PM:

> From: Arnout Vandecappelle <arnout@mind.be>
> To: Matthew Weber <mlweber1@rockwellcollins.com>
> Cc: buildroot at busybox.net
> Date: 10/01/2013 03:42 PM
> Subject: Re: [Buildroot] [PATCH 1/1] omniorb: cleanup autobuild 
> failure, CFLAGS issue
> 
> On 10/01/13 21:33, Matthew Weber wrote:
> > Arnout Vandecappelle<arnout@mind.be>  wrote on 10/01/2013 11:30:04 AM:
> [snip]
> >>> > >+# Defaulting long double support to a safe option for the
> >>> > >+# mix of embedded targets, this could later be automated
> >>> > >+# based on checking the capability of the cross toolchain
> >>> > >+# for "__LONG_DOUBLE_128__".  Currently the host and target
> >>> > >+# need to match because of the code generation done by the
> >>> > >+# host tools during the target compile (ie headers generated
> >>> > >+# on host are used in target build).
> >> >
> >> >   Ouch, this smells like there could also be an issue when the host 
and
> >> >the target have different data representations (e.g. endianness or
> >> >bitwidth). Do you think there is a risk of this?
>  >
> > I don't believe there is a risk if I also disable it on the host
> > (which I'll add in my next update).
> 
>   That's not what I meant. For longdouble it's fine because it's 
> disabled. However, you are building the omniidl with native compilation, 

> and you use that to generate some source code for the target (at least 
> that's what I understand). My guess is that this is used to generate the 

> (de)serialization code of the RPC. However, if omniorb is so bad at 
> cross-compilation, there is a risk that they didn't consider that the 
> endianness and bitwidths of the generated code may be different from the 

> endianness and bitwidths that are detected during native compilation.
> 
>   So to be sure, it should be tested on a big-endian target if the 
> generated code works correctly. Bitwidths are even trickier to test...
> 

Sorry, this is going to get a little messy, bare with me.
The basis for my cross build was from this website, he outlined
some of the issues.
http://www.omniorb-support.com/omniwiki/CrossCompiling

I've done some additional checking....  I think we do have an issue
since I separated the host build out from the target build.
Now the configure script for the host (tools) build isn't 
getting called with the target config opts. 
This means all the arch specific headers and datatype
sizing isn't getting stored and used during the native build. 
I.e. any builds of native tools aren't 
constrained to the target definitions.  I believe if I add
an override of the host configure script to run 
with the target config opts, then it should be back to the 
original assumptions and produce correct tool (omniidle) outputs.
- At that point the endianess then should also be ok, since 
the config script checking is used to adjust the build to create 
the correct target outputs.  I have seen where this was causing a bug 
in a previous version, so I believe it's working. 
However I will build for a PPC and give things a try.
- Next the bitwidths issue....  Since we first do a config
against the target architecture during the host build, 
it sets up all the headers to match the target. 
From that output, I did verify the datatypes 
were getting sizing according to the target.

>   Regards,
>   Arnout
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
