From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Tue, 07 Feb 2017 13:54:09 +0100
Subject: [Buildroot] [PATCH v2 1/2] bctoolbox: new package
In-Reply-To: <87mvdytffw.fsf@dell.be.48ers.dk>
References: <20170122210021.9463-1-joerg.krause@embedded.rocks>
 <87mvdytffw.fsf@dell.be.48ers.dk>
Message-ID: <1486472049.1692.1.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2017-02-07 at 12:20 +0100, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> ?> bctoolbox is a utilities library used by Belledonne Communications
> ?> softwares like belle-sip, mediastreamer2 and linphone.
> 
> ?> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> This seems to break building ortp statically:
> 
> http://autobuild.buildroot.org/?reason=ortp-0.27.0
> 
> Looking further, it comes from the bctoolbox pkg-config file
> libs.private:
> 
> bctoolbox-0.4.0/bctoolbox.pc.in:
> Libs.private: @LIBS_PRIVATE@
> 
> Which gets populated from cmake:
> 
> bctoolbox-0.4.0/CMakeLists.txt:
> 
> if(MBEDTLS_FOUND)
> ????????get_filename_component(mbedtls_library_path
> "${MBEDTLS_LIBRARIES}" PATH)
> ????????set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedlts_library_path}")
> endif()
> 
> mbedtls_library_path is apparently the empty string, so it ends up
> just
> with "-L".
> 
> Samuel/J?rg, any idea how this should work?

I already had a look at this, but had no time to prepare a fix for it
so far. The problem is that `-lmbedtls` is missing after `-L`. So it
should be:

set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedlts_library_path}?-lmbedtls")

However, there are some more issues with the bctoolbox package to get
static linking working properly.

J?rg
