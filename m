From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 14:20:22 +0100
Subject: [Buildroot] Problem using Linux kernel archive from Gitorious
In-Reply-To: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
References: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
Message-ID: <50FA9D96.60802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/01/13 15:47, Aras Vaichas wrote:
> Hello,
> 
> I am configuring Buildroot to use an OMAP-L138/DaVinci CPU. I'd like
> to use the Linux kernel version from
> http://gitorious.org/linux-davinci/linux-davinci/trees/v3.7-davinci1
> which is a specific tag in the git repository.
> 
> In Buildroot I set:
> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=http://gitorious.org/linux-davinci/linux-davinci/archive-tarball/v3.7-davinci1

 It's a bit of a hack, but use this URL:

http://gitorious.org/linux-davinci/linux-davinci/archive-tarball/v3.7-davinci1?dummyname=/linux-v3.7-davinci.tar.gz

 The CGI script that is behind that URL will ignore any unknown variables
behind the ? and the download method of buildroot will consider the thing
behind the last / as the filename. So this URL will be split into

LINUX_SITE = http://gitorious.org/linux-davinci/linux-davinci/archive-tarball/v3.7-davinci1?dummyname=
LINUX_SOURCE = linux-v3.7-davinci.tar.gz

 So this gives you a nicely named file in the download directory.


 Note that the gitorious archive URLs have an important disadvantage:
if the archive is not already in the cache, than the site will respond
with a '202 Accepted'.  I think wget treats this as a success, so
buildroot will try to untar that placeholder file.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
