From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Fri, 25 Jan 2013 11:53:19 +0000
Subject: [Buildroot] Problem using Linux kernel archive from Gitorious
In-Reply-To: <5100D594.7000000@mind.be>
References: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
 <50FA9D96.60802@mind.be>
 <CAJkQPOnp5gk+GZc6BewOCqtv4EnktvNe=DXbdJv-fgh8Lsdvyg@mail.gmail.com>
 <5100D594.7000000@mind.be>
Message-ID: <CAJkQPOnSr9t5OOy=2GE=bA3xKLH2-RFy695mpce4Oo2P6G9Ciw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24 January 2013 06:32, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 01/21/13 12:30, Aras Vaichas wrote:
>>
>> On 19 January 2013 13:20, Arnout Vandecappelle<arnout@mind.be>  wrote:
>>>
>>> On 17/01/13 15:47, Aras Vaichas wrote:
>>>>
>>>> Hello,
>>>>
>>>> I am configuring Buildroot to use an OMAP-L138/DaVinci CPU. I'd like
>>>> to use the Linux kernel version from
>>>> http://gitorious.org/linux-davinci/linux-davinci/trees/v3.7-davinci1
>>>> which is a specific tag in the git repository.

... SNIP...

>  You can of course use the git download method instead of the tarball. Since
> you're downloading a tag, a shallow clone should work, so the overhead
> compared to a tarball is limited.

That is actually where I started, but it kept doing a full clone, so I
revisited what I did.

The tag, according to the davinci gitorious website is
"v3.7-davinci1", so I tried that first but Buildroot returned:

>>> linux v3.7-davinci1 Downloading
/bin/bash: line 0: test: refs/tags/v3.7-davinci1: unary operator expected
Doing full clone
Cloning into bare repository 'linux-v3.7-davinci1'...

I didn't notice the error before so I investigated package/pkg-download.mk.

$ git ls-remote git://gitorious.org/linux-davinci/linux-davinci.git |
cut -f 2- | grep v3.7-davinci1

refs/tags/v3.7-davinci1
refs/tags/v3.7-davinci1^{}

It returns two separate strings, and this causes the test function to
fail and drop through to a full clone.

Here is a fix:

--- a/package/pkg-download.mk	2013-01-25 11:02:03.491175888 +0000
+++ b/package/pkg-download.mk	2013-01-25 11:35:50.531175646 +0000
@@ -82,7 +82,7 @@
 define DOWNLOAD_GIT
 	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 	(pushd $(DL_DIR) > /dev/null && \
-	 ((test `git ls-remote  $($(PKG)_SITE) | cut -f 2- | grep
$($(PKG)_DL_VERSION)` && \
+	 ((test "`git ls-remote  $($(PKG)_SITE) | cut -f 2- | grep
$($(PKG)_DL_VERSION)`" && \
 	   echo "Doing shallow clone" && \
 	   $(GIT) clone --depth 1 -b $($(PKG)_DL_VERSION) --bare
$($(PKG)_SITE) $($(PKG)_BASE_NAME)) || \
 	  (echo "Doing full clone" && \

Shall I post a patch? (I use gmail, so it tends to word wrap the patch)

regards,

Aras Vaichas
