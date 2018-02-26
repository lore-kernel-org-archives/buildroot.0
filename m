From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 13:48:03 +0100
Subject: [Buildroot] Analysis of build results for 2018-02-25
In-Reply-To: <20180226113319.7e3bcf6b@windsurf.lan> (Thomas Petazzoni's
 message of "Mon, 26 Feb 2018 11:33:19 +0100")
References: <20180226070010.28C8620727@mail.bootlin.com>
 <20180226113319.7e3bcf6b@windsurf.lan>
Message-ID: <87fu5nsyrg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > We're almost at the end of the month, and therefore almost at the
 > final 2018.02, which will be a LTS. I believe it is a good opportunity
 > to make a final effort to resolve the remaining build failures. See
 > below for an analysis.

Thanks for the overview.

 >> powerpc | binutils-2.29.1 | NOK |
 >> http://autobuild.buildroot.net/results/22839bca79e16fc0d76ebc0f3e5ec4a6d23e99f6
 >> | ORPH

 > read.c: In function 's_app_line':
 > read.c:2001:1: internal compiler error: Segmentation fault
 >  s_app_line (int appline)

 > Compiler error. It's on PowerPC, with a toolchain from 2017.11. Could
 > someone retry with a newer gcc, and see if it is fixed ?

Notice that this happened on gcc67, so on the Ryzen CPU (and nowhere
else), so I'm afraid the Ryzen crashes are _STILL_ not fixed. I'll stop
the autobuilder again.


 > Readline is now needed. We have a patch to add readline as a
 > dependency (https://patchwork.ozlabs.org/patch/860386/), but Baruch
 > (and me) asked to ask upstream about it, because it looked like a
 > possibly unintentional change. Since nobody investigated further, I
 > propose that we apply Bernd's patch adding the readline dependency. If
 > someone is unhappy with it, we can always revert when the problem is
 > fixed.

Yes, I guess this is the best solution for 2018.02.


 >> aarch64 | mesa3d-17.3.5 | NOK |
 >> http://autobuild.buildroot.net/results/a4d7c2720dbe7f6dd7111c507711dc23cc25b6cc
 >> |

 > glsl/glsl_parser_extras.cpp: In function 'bool
 > do_common_optimization(exec_list*, bool, bool, const
 > gl_shader_compiler_options*, bool)':
 > glsl/glsl_parser_extras.cpp:2178:1: internal compiler error: Segmentation fault

 > Meh, a compiler failure. Bernd, could you test with various gcc
 > versions, and see if the problem has been fixed ?

Once more on gcc67 (and no other autobuilders), please ignore.


 >> i686 | mplayer-1.3.0 | NOK |
 >> http://autobuild.buildroot.net/results/ec4e7e975c2e8f978a771a1702933d0612e95a9c
 >> |

 > I guess this is fixed by the old patches submitted by Bernd, which are
 > still in patchwork. I'm still not super happy about these patches,
 > though (as I already expressed as a reply to those patches).

Agreed, but what are the alternatives? Make the package unavailable for
x86 or drop it completely, as it is afaik dead upstream.


 >> powerpc | qt-4.8.7 | NOK |
 >> http://autobuild.buildroot.net/results/b0ff91d12a569ae9f6a78b1c62c75fb64e207be3
 >> | ORPH

 > tools/qtextboundaryfinder.cpp:444:1: internal compiler error: in
 > validate_condition_mode, at config/rs6000/rs6000.c:18074

 > Someone to test this with newer gcc versions ?

Or deprecate qt4?


 >> arm | systemd-237 | NOK |
 >> http://autobuild.buildroot.net/results/c2985c0471cfb8e396991bce125222d15474d0d0
 >> |

 > The infamous locale issue. Unless someone comes up with a better
 > solution than https://patchwork.ozlabs.org/patch/876880/, I think I'm
 > going to go ahead and apply this fix.

Agreed, considering how close we are getting to 2018.02.

-- 
Bye, Peter Korsgaard
