From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Nov 2012 02:51:24 +0100
Subject: [Buildroot] mesa3d:  "ImportError: No module named libxml2"
In-Reply-To: <1531E53627F1F749B4FE809BF2A4EB6703A24FFD@wetmex10>
References: <1531E53627F1F749B4FE809BF2A4EB6703A24FFD@wetmex10>
Message-ID: <509DB31C.90903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/12 10:18, Vellemans, Noel wrote:
> I do end up with this error while building mesa3d"  "ImportError: No
> module named libxml2" (ONLY if I do build into a clean-output
> directory!)
>
> The strange thing is that when building for a second time it all builds
> fine.

  The problem is that host-python is used, not native python, and host-python
doesn't have libxml2 bindings.  python is used to generate api_exec_es1.c:
python -t -O -O main/es_generator.py -S main/APIspec.xml -V GLES1.1 > main/api_exec_es1.c
When you run it the second time, the file exists (and is empty), so you
won't get an error.  But as soon as you try to use GLES, you'll notice that
it doesn't work :-)

  The problem is that libxml2 python bindings are part of libxml2.  If we want
to build them, we would have to make host-libxml2 depend on host-python...
And that's certainly something we don't want.

  A work-around is to set
MESA3D_CONF_ENV = PYTHON2=/usr/bin/python
but that's not something we want to do in buildroot either, because there is
not guarantee that native python has libxml2, or that the native python is
python2, or that it is in /usr/bin.

  The only realistic solution I can think of is to create a blind
BR2_NEED_HOST_LIBXML2_PYTHON_BINDINGS and select this from mesa3d.  Then we
can conditionally depend on host-python and build the bindings in libxml2.mk.
But it is still fairly horrible.

  BTW, Thomas already told you this on October 12 (though his explanation
was a bit shorter :-).

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
