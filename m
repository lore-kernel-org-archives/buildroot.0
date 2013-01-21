From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Mon, 21 Jan 2013 11:30:24 +0000
Subject: [Buildroot] Problem using Linux kernel archive from Gitorious
In-Reply-To: <50FA9D96.60802@mind.be>
References: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
 <50FA9D96.60802@mind.be>
Message-ID: <CAJkQPOnp5gk+GZc6BewOCqtv4EnktvNe=DXbdJv-fgh8Lsdvyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 January 2013 13:20, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 17/01/13 15:47, Aras Vaichas wrote:
>> Hello,
>>
>> I am configuring Buildroot to use an OMAP-L138/DaVinci CPU. I'd like
>> to use the Linux kernel version from
>> http://gitorious.org/linux-davinci/linux-davinci/trees/v3.7-davinci1
>> which is a specific tag in the git repository.
>>
>> In Buildroot I set:
>> BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>> BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=http://gitorious.org/linux-davinci/linux-davinci/archive-tarball/v3.7-davinci1
>
>  It's a bit of a hack, but use this URL:
>
> http://gitorious.org/linux-davinci/linux-davinci/archive-tarball/v3.7-davinci1?dummyname=/linux-v3.7-davinci.tar.gz
>  The CGI script that is behind that URL will ignore any unknown variables
> behind the ? and the download method of buildroot will consider the thing
> behind the last / as the filename. So this URL will be split into
>
> LINUX_SITE = http://gitorious.org/linux-davinci/linux-davinci/archive-tarball/v3.7-davinci1?dummyname=
> LINUX_SOURCE = linux-v3.7-davinci.tar.gz
>
>  So this gives you a nicely named file in the download directory.
>
>
>  Note that the gitorious archive URLs have an important disadvantage:
> if the archive is not already in the cache, than the site will respond
> with a '202 Accepted'.  I think wget treats this as a success, so
> buildroot will try to untar that placeholder file.

Thank you. Yes, I did notice the delay the first time I tried to
download the tarball. I figured this would be a problem.

I'm currently configuring Buildroot for a company, so I want (need) to
provide links that will always work. I think what I will do is create
a davinci patch against a particular version of Linux and tell the
company to store the patch in their own source repository. That
guarantees that they can always get the file and re-recreate the same
same kernel - assuming kernel.org always has a copy of the original
kernel source for a particular version. :)

Aras
