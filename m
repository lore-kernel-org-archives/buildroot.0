From: Floris Bos <bos@je-eigen-domein.nl>
Date: Sun, 10 Feb 2013 15:51:39 +0100
Subject: [Buildroot] [PATCH] package/rpi-userland: update to fix
 no-longer applying patch
In-Reply-To: <CAGduivzJBf_OzuFce2Ym_yFpSx9RWLzOXvhLRPjfXrQU8NgZmQ@mail.gmail.com>
References: <1360497506-31282-1-git-send-email-yann.morin.1998@free.fr>
 <51179F8D.6050800@je-eigen-domein.nl>
 <CAGduivzJBf_OzuFce2Ym_yFpSx9RWLzOXvhLRPjfXrQU8NgZmQ@mail.gmail.com>
Message-ID: <5117B3FB.1010401@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/2013 03:14 PM, Maxime Hadjinlian wrote:
> On Sun, Feb 10, 2013 at 2:24 PM, Floris Bos <bos@je-eigen-domein.nl> wrote:
>> On 02/10/2013 12:58 PM, Yann E. MORIN wrote:
>>> Our patches do not apply as-is against the version of rpi-userland we
>>> package (weird...).
>>
>> RPI_USERLAND_SITE = http://github.com/raspberrypi/userland/tarball/master
>>
>> Shouldn't that be something like this?
>>
>> RPI_USERLAND_SITE =
>> http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)
>>
> You are using the version variable only if the projects has tag, which
> this one hasn't.
> Then, you are forced to use sha1 version, then you give the branch
> where this sha1 can be found.
> As specified in the doc :
> http://buildroot.uclibc.org/downloads/manual/manual.html#github-download-url

Documentation is incorrect/outdated.

Github only looks at the folder name, ignores the filename, and will 
redirect you to 
https://nodeload.github.com/raspberrypi/userland/legacy.tar.gz/master

==
--2013-02-10 15:42:21-- 
http://github.com/raspberrypi/userland/tarball/master/rpi-userland-9852ce28826889e50c4d6786b942f51bccccac54.tar.gz
Resolving github.com (github.com)... 207.97.227.239
Connecting to github.com (github.com)|207.97.227.239|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: 
https://github.com/raspberrypi/userland/tarball/master/rpi-userland-9852ce28826889e50c4d6786b942f51bccccac54.tar.gz 
[following]
--2013-02-10 15:42:21-- 
https://github.com/raspberrypi/userland/tarball/master/rpi-userland-9852ce28826889e50c4d6786b942f51bccccac54.tar.gz
Connecting to github.com (github.com)|207.97.227.239|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: 
https://nodeload.github.com/raspberrypi/userland/legacy.tar.gz/master 
[following]
--2013-02-10 15:42:21-- 
https://nodeload.github.com/raspberrypi/userland/legacy.tar.gz/master
==



With 
"RPI_USERLAND_SITE=http://github.com/raspberrypi/userland/tarball/$(RPI_USERLAND_VERSION)" 
it does work:

==
--2013-02-10 15:45:53-- 
http://github.com/raspberrypi/userland/tarball/9852ce28826889e50c4d6786b942f51bccccac54/rpi-userland-9852ce28826889e50c4d6786b942f51bccccac54.tar.gz
Resolving github.com (github.com)... 207.97.227.239
Connecting to github.com (github.com)|207.97.227.239|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: 
https://github.com/raspberrypi/userland/tarball/9852ce28826889e50c4d6786b942f51bccccac54/rpi-userland-9852ce28826889e50c4d6786b942f51bccccac54.tar.gz 
[following]
--2013-02-10 15:45:53-- 
https://github.com/raspberrypi/userland/tarball/9852ce28826889e50c4d6786b942f51bccccac54/rpi-userland-9852ce28826889e50c4d6786b942f51bccccac54.tar.gz
Connecting to github.com (github.com)|207.97.227.239|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: 
https://nodeload.github.com/raspberrypi/userland/legacy.tar.gz/9852ce28826889e50c4d6786b942f51bccccac54 
[following]
--2013-02-10 15:45:53-- 
https://nodeload.github.com/raspberrypi/userland/legacy.tar.gz/9852ce28826889e50c4d6786b942f51bccccac54
Resolving nodeload.github.com (nodeload.github.com)... 207.97.227.252
Connecting to nodeload.github.com 
(nodeload.github.com)|207.97.227.252|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 32085513 (31M) [application/x-gzip]
==


Yours sincerely,

Floris Bos
