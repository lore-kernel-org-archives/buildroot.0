From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Sep 2017 15:39:29 +0200
Subject: [Buildroot] [PATCH v2] pkg-download: remove explicit
	PKG_VERSION from github helper
In-Reply-To: <4596376b-607d-46f5-1c57-d8e8791cf57b@mind.be> (Arnout
 Vandecappelle's message of "Sun, 24 Sep 2017 13:53:55 +0200")
References: <1504765866-7138-1-git-send-email-marcin.nowakowski@imgtec.com>
 <4596376b-607d-46f5-1c57-d8e8791cf57b@mind.be>
Message-ID: <87o9psfgq6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 07-09-17 08:31, Marcin Nowakowski wrote:
 >> Currently it is always required to add package version as an argument to
 >> the github helper. Since the version is always defined as PKG_VERSION,
 >> drop this argument and generate it automatically inside the helper
 >> routine.
 >> 
 >> The github helper function is extended to support both 2 and 3 argument
 >> variants (ie. either use the provided package version argument or
 >> automatically substitute with PKG_VERSION if not available), which can
 >> make the transition of the package files easier as well allows using the
 >> 3-argument variant outside of package definitions.
 >> 
 >> Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>


 >  Applied to master, thanks. I extended the text in the manual a little bit to
 > cover the case where you do have to use the third argument.

 >  Next step is a mass update removing the third argument.

Have you tested this? It doesn't seem to work for me UNLESS I use

FOO_SITE := $(call github,user,product)

Instead of the normal FOO_SITE = to get it expanded right away. I guess
pkgname gets expanded too late.

E.G. if I drop the explicit version argument from librtlsdr:

LIBRTLSDR_SITE = $(call github,steve-m,librtlsdr)


make BR2_BACKUP_SITE='' librtlsdr-source
>>> librtlsdr v0.5.3 Downloading
--2017-09-30 15:36:00--  https://github.com/steve-m/librtlsdr/archive//librtlsdr-v0.5.3.tar.gz
Resolving github.com (github.com)... 192.30.253.112, 192.30.253.113
Connecting to github.com (github.com)|192.30.253.112|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/steve-m/librtlsdr/tar.gz/librtlsdr-v0.5.3 [following]
--2017-09-30 15:36:00--  https://codeload.github.com/steve-m/librtlsdr/tar.gz/librtlsdr-v0.5.3
Resolving codeload.github.com (codeload.github.com)... 192.30.253.120, 192.30.253.121
Connecting to codeload.github.com (codeload.github.com)|192.30.253.120|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2017-09-30 15:36:01 ERROR 404: Not Found.

package/pkg-generic.mk:146: recipe for target '/home/peko/source/buildroot/output-rpi/build/librtlsdr-v0.5.3/.stamp_downloaded' failed

Notice the missing version between archive and the file name.


With LIBRTLSDR_SITE := $(call github,steve-m,librtlsdr) I get:

make BR2_BACKUP_SITE='' librtlsdr-source
>>> librtlsdr v0.5.3 Downloading
--2017-09-30 15:38:20--  https://github.com/steve-m/librtlsdr/archive/v0.5.3/librtlsdr-v0.5.3.tar.gz
Resolving github.com (github.com)... 192.30.253.113, 192.30.253.112
Connecting to github.com (github.com)|192.30.253.113|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/steve-m/librtlsdr/tar.gz/v0.5.3 [following]
--2017-09-30 15:38:21--  https://codeload.github.com/steve-m/librtlsdr/tar.gz/v0.5.3
Resolving codeload.github.com (codeload.github.com)... 192.30.253.121, 192.30.253.120
Connecting to codeload.github.com (codeload.github.com)|192.30.253.121|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: ?/home/peko/source/buildroot/output-rpi/build/.librtlsdr-v0.5.3.tar.gz.CsUtgo/output?

/home/peko/source/buildroot/output-rpi/build/.librtlsdr-     [  <=>                                                                                                                             ] 114.66K   374KB/s    in 0.3s

2017-09-30 15:38:22 (374 KB/s) - ?/home/peko/source/buildroot/output-rpi/build/.librtlsdr-v0.5.3.tar.gz.CsUtgo/output? saved [117414]

librtlsdr-v0.5.3.tar.gz: OK (sha256: 98fb5c34ac94d6f2235a0bb41a08f8bed7949e1d1b91ea57a7c1110191ea58de)


I'm not sure how to fix it inside the github wrapper though.

-- 
Bye, Peter Korsgaard
