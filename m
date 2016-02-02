From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 22:37:28 +0100
Subject: [Buildroot] Problem with python packages in .zip format
In-Reply-To: <F9CA10A6-C5B6-4D4D-B38A-829D1D422751@xiot.nl>
References: <F9CA10A6-C5B6-4D4D-B38A-829D1D422751@xiot.nl>
Message-ID: <56B12198.40705@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02-02-16 21:49, Eelco Chaudron wrote:
> Hi All,
> 
> Before I start investigating I was wondering if some one has seen this before?
> If the python packages is in .zip it does not seem to know how to extract and
> thinks it a binary.

 That's right, we don't have automatic handling of zip files. You have to define
the extraction commands explicitly. See for example the python-keyring package.

 The reason we don't have automatic extraction of zip files is that it doesn't
have the --strip-components option of tar. For packages that put everything in a
<pkg>-<version> directory, you can just extract in $(BUILD_DIR). But of course,
a package that is crazy enough to use a zip file is unlikely to follow sane
conventions, so in many cases it will be in some other subdirectory. Or in the
case of python packages, the upstream package typically doesn't have the python-
prefix and we want that, so you have to move it to the right place. Like
python-keyring does.


> See the following:
> 
> $ make python-flask-wtf
>>>> python-wtforms 2.1 Downloading
> --2016-02-02 21:45:45-- 
> https://pypi.python.org/packages/source/W/WTForms/WTForms-2.1.zip

 Please don't post HTML mails with all those annoying colours.


 Regards,
 Arnout

> Resolving pypi.python.org <http://pypi.python.org> (pypi.python.org
> <http://pypi.python.org>)... 23.235.43.223
> Connecting to pypi.python.org <http://pypi.python.org> (pypi.python.org
> <http://pypi.python.org>)|23.235.43.223|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 553644 (541K) [application/octet-stream]
> Saving to: ?/home/echaudron/buildroot/output/build/.WTForms-2.1.zip.3oIKIZ/output?
> 
> /home/echaudron/buildroot/output/build/.WTForms-2.1.zip.3oIKI
> 100%[==================================================================================================================================================================================>]
> 540.67K  3.42MB/s   in 0.2s   
> 
> 2016-02-02 21:45:45 (3.42 MB/s) -
> ?/home/echaudron/buildroot/output/build/.WTForms-2.1.zip.3oIKIZ/output? saved
> [553644/553644]
> 
> WTForms-2.1.zip: OK (md5: 6938a541fafd1a1ae2f6b9b88588eef2)
> WTForms-2.1.zip: OK (sha256:
> ffdf10bd1fa565b8233380cb77a304cd36fd55c73023e91d4b803c96bc11d46f)
>>>> python-wtforms 2.1 Extracting
> /home/echaudron/buildroot/dl/WTForms-2.1.zip | tar --strip-components=1 -C
> /home/echaudron/buildroot/output/build/python-wtforms-2.1   -xf -
> /bin/bash: /home/echaudron/buildroot/dl/WTForms-2.1.zip: Permission denied
> tar: This does not look like a tar archive
> tar: Exiting with failure status due to previous errors
> package/pkg-generic.mk:128: recipe for target
> '/home/echaudron/buildroot/output/build/python-wtforms-2.1/.stamp_extracted' failed
> make[1]: ***
> [/home/echaudron/buildroot/output/build/python-wtforms-2.1/.stamp_extracted] Error 2
> Makefile:36: recipe for target '_all' failed
> make: *** [_all] Error 2
> 
> Thanks,
> 
> Eelco
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
