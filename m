From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 12:20:51 +0100
Subject: [Buildroot] [PATCH v2 1/2] bctoolbox: new package
In-Reply-To: <20170122210021.9463-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Sun, 22 Jan 2017 22:00:20 +0100")
References: <20170122210021.9463-1-joerg.krause@embedded.rocks>
Message-ID: <87mvdytffw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:

 > bctoolbox is a utilities library used by Belledonne Communications
 > softwares like belle-sip, mediastreamer2 and linphone.

 > Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

This seems to break building ortp statically:

http://autobuild.buildroot.org/?reason=ortp-0.27.0

Looking further, it comes from the bctoolbox pkg-config file
libs.private:

bctoolbox-0.4.0/bctoolbox.pc.in:
Libs.private: @LIBS_PRIVATE@

Which gets populated from cmake:

bctoolbox-0.4.0/CMakeLists.txt:

if(MBEDTLS_FOUND)
        get_filename_component(mbedtls_library_path "${MBEDTLS_LIBRARIES}" PATH)
        set(LIBS_PRIVATE "${LIBS_PRIVATE} -L${mbedlts_library_path}")
endif()

mbedtls_library_path is apparently the empty string, so it ends up just
with "-L".

Samuel/J?rg, any idea how this should work?

-- 
Bye, Peter Korsgaard
