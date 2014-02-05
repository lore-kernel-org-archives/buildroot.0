From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Wed, 5 Feb 2014 13:50:49 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-04
In-Reply-To: <20140205073010.8762B101A86@stock.ovh.net>
References: <20140205073010.8762B101A86@stock.ovh.net>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356C636FF@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>        arc |                audiofile-0.3.6 | NOK |
> http://autobuild.buildroot.net/results/d88d608e656ee3df374e857a817f0e7f
> 0e296814/

This one happens because of:
1) libtool adds libstdc++.la to the dependency_libs
2) Because of patch 0a4bd19f Buildroot sets LDFLAGS to --static, instead of -static. libtool doesn?t understand the former and passes it to GCC as is.
3) However because libstdc++.la is in the list of dependencies and libtool doesn't know that linking is static it resolves libstdc++.la to the libstdc++.so instead of libstdc++.a.
4) So GCC is called with an option --static, but with  shared library as an argument as well, so linker exits with an error.

Passing -static to libtool instead of --static resolves the issue for me: libstdc++ is resolved to shared object by libtool, but static flag is not passed to the gcc as well. Using -all-static also helps, as it ensures that everything that is passed to gcc is static, including libstdc++. 

I'm not a libtool expert, so I don't know why would it add libstdc++ to the list of dependencies, should it be there? It doesn?t happen for me when I'm not cross-compiling, so I'm not sure if it is libtool that shouldn't add libstdc++ to list (maybe there is something specific about ARC gcc?) or is that Buildroot should be more sensible to what arguments it is passing to gcc or libtool.

Anton Kolesov
