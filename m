From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2012 18:21:42 +0100
Subject: [Buildroot] ccache problem with codesourcery toolchain
In-Reply-To: <1328465480.15765.YahooMailNeo@web160904.mail.bf1.yahoo.com>
References: <1328403901.12122.YahooMailNeo@web160901.mail.bf1.yahoo.com>
 <20120205084546.2db4fec8@skate>
 <1328465480.15765.YahooMailNeo@web160904.mail.bf1.yahoo.com>
Message-ID: <201202071821.43045.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 05 February 2012 19:11:20 D M wrote:
> > or even directly modify the ccache code to make it the default.
> 
> I hadn't considered patching ccache itself to make "none" the
> default.  I wasn't sure if other use-cases of buildroot would
> actually want to have the "mtime" setting - like maybe a completely
> external toolchain?

 You're right: if you do a make clean, change the config of the toolchain,
and make again, then we don't want to take object files out of the cache...
Of course, we already had this situation in earlier versions of ccache.

> So I was envisioning a sub-menu where you could
> select 1 of the 3 options to be explicitly set in the CCACHE var, or maybe
> 1 of 4 to have a dont-specify-anything option; or a text field, to type in
> whatever you want - in case you want to specify additional env vars, like
> the CCACHE_BASEDIR var, so that parallel buildroot trees can use the 
> same cached objects.

 I think that's a bit too complex.

 I see two generic solutions:

- Stick to mtime, but make sure the mtime of external toolchains isn't 
changed.  Since we actually create a toolchain wrapper, we'd need to do
a 'touch -r <real-toolchain>' on it.

- Use the command string option of CCACHE_COMPILERCHECK.  We can
calculate a static hash of the compiler/kernel-headers/libc/whatnot
configuration, and use 'echo <hash>' as the value of
CCACHE_COMPILERCHECK.  That's quite a bit more complex, but it
makes it possible to use the compiler cache also for an internal
toolchain after you've done a make clean.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
