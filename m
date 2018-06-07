From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 7 Jun 2018 23:16:21 +0200
Subject: [Buildroot] scanpypi tool python error - local variable
 'download' referenced before assignment
In-Reply-To: <55bf291b-22cf-b254-d04c-e7bf017f85be@jcz.nl>
References: <55bf291b-22cf-b254-d04c-e7bf017f85be@jcz.nl>
Message-ID: <660c6058-1507-be7a-8cda-87fc741b8ed1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-06-18 17:29, Jaap Crezee wrote:
> Hi all,
> 
> 
> Is this a known issue?
> 
> [jaap at jaap /data/work/htc/git/buildroot_development ]$ git log -1
> commit f3d114a1effd8a6ef773bee14fe49ea6d8d7c350 (HEAD, tag: 2018.05)
> Author: Peter Korsgaard <peter@korsgaard.com>
> Date:   Fri Jun 1 22:22:57 2018 +0200
> 
>     Update for 2018.05
> 
>     Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> [jaap at jaap /data/work/htc/git/buildroot_development ]$ ./utils/scanpypi azure-iothub-device-client
> buildroot package name for azure-iothub-device-client: python-azure-iothub-device-client
> Package: python-azure-iothub-device-client
> Fetching package azure-iothub-device-client
> Traceback (most recent call last):
>   File "./utils/scanpypi", line 716, in <module>
>     main()
>   File "./utils/scanpypi", line 648, in main
>     package.download_package()
>   File "./utils/scanpypi", line 217, in download_package
>     if download.__class__ == six.moves.urllib.error.HTTPError:
> UnboundLocalError: local variable 'download' referenced before assignment
> [jaap at jaap /data/work/htc/git/buildroot_development ]$

 This happens because the metadata doesn't contain urls.

 scanpypi is not at all robust against unexpected metadata contents. I think we
should add some exception handling there that just prints the metadata (or the
relevant parts of it), and continues with other packages (in case it's a
dependency of the package that was requested).

 Yegor?

 Regards,
 Arnout


> 
> regards,
> 
> 
> Jaap
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
