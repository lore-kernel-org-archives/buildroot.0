From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 Oct 2013 22:41:53 +0200
Subject: [Buildroot] [PATCH 1/1] omniorb: cleanup autobuild failure,
 CFLAGS issue
In-Reply-To: <OF8984387D.63FADA60-ON86257BF7.006A9834-86257BF7.006B779D@rockwellcollins.com>
References: <1380311674-6883-1-git-send-email-mlweber1@rockwellcollins.com>
 <524AF88C.4070906@mind.be>
 <OF8984387D.63FADA60-ON86257BF7.006A9834-86257BF7.006B779D@rockwellcollins.com>
Message-ID: <524B3391.5020907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/01/13 21:33, Matthew Weber wrote:
> Arnout Vandecappelle<arnout@mind.be>  wrote on 10/01/2013 11:30:04 AM:
[snip]
>>> > >+# Defaulting long double support to a safe option for the
>>> > >+# mix of embedded targets, this could later be automated
>>> > >+# based on checking the capability of the cross toolchain
>>> > >+# for "__LONG_DOUBLE_128__".  Currently the host and target
>>> > >+# need to match because of the code generation done by the
>>> > >+# host tools during the target compile (ie headers generated
>>> > >+# on host are used in target build).
>> >
>> >   Ouch, this smells like there could also be an issue when the host and
>> >the target have different data representations (e.g. endianness or
>> >bitwidth). Do you think there is a risk of this?
 >
> I don't believe there is a risk if I also disable it on the host
> (which I'll add in my next update).

  That's not what I meant. For longdouble it's fine because it's 
disabled. However, you are building the omniidl with native compilation, 
and you use that to generate some source code for the target (at least 
that's what I understand). My guess is that this is used to generate the 
(de)serialization code of the RPC. However, if omniorb is so bad at 
cross-compilation, there is a risk that they didn't consider that the 
endianness and bitwidths of the generated code may be different from the 
endianness and bitwidths that are detected during native compilation.

  So to be sure, it should be tested on a big-endian target if the 
generated code works correctly. Bitwidths are even trickier to test...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
