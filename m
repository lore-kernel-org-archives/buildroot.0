From: Viallard Anthony <viallard@syscom-instruments.com>
Date: Fri, 07 Dec 2012 09:41:13 +0100
Subject: [Buildroot] [PATCH] fix cjson package
In-Reply-To: <CANxTyt4OZM0u3jyGrDoAQPvBSzVQ_=BHz_c0rNW6Y9pSr1jzbQ@mail.gmail.com>
References: <50C0B73C.9020407@syscom-instruments.com>
 <CANxTyt4OZM0u3jyGrDoAQPvBSzVQ_=BHz_c0rNW6Y9pSr1jzbQ@mail.gmail.com>
Message-ID: <50C1ABA9.2030202@syscom-instruments.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07. 12. 12 03:14, Danomi Manchego wrote:
> Viallard,
>
>> -CJSON_VERSION         = undefined
>> -CJSON_SOURCE          = cJSONFiles.zip
>> +CJSON_VERSION         = 2011-10-10
>> +CJSON_SOURCE          = cJSONFiles-$(CJSON_VERSION).zip
>>   CJSON_SITE            = http://downloads.sourceforge.net/project/cjson/
> This worked for you?  It doesn't work for me ... i.e. this line works for me:
>
>      wget http://downloads.sourceforge.net/project/cjson/cJSONFiles.zip
>
> but this line gives me ERROR 404 Not Found:
>
>      wget http://downloads.sourceforge.net/project/cjson/cJSONFiles-2011-10-10.zip
>
> Am I missing something here?
>
> Danomi -
Actually, "wget 
http://downloads.sourceforge.net/project/cjson/cJSONFiles.zip" works and 
the other link not indeed. I just realize I've a "Backup download site" 
with cJSONFiles-2011-10-10.zip on it ...

But there really a problem when buildroot trying to download the file :

-----------------------
avd at avd-box:~/wksp/buildroot$ make cjson-build
 >>> cjson undefined Downloading
--2012-12-07 09:24:34--  http://192.168.2.17/files/buildroot/cJSONFiles.zip
Connexion vers 192.168.2.17:80...connect?.
requ?te HTTP transmise, en attente de la r?ponse...404 Not Found
2012-12-07 09:24:34 ERREUR 404: Not Found.

--2012-12-07 09:24:34--  
http://downloads.sourceforge.net/project/cjson//cJSONFiles.zip
R?solution de downloads.sourceforge.net (downloads.sourceforge.net)... 
216.34.181.59
Connexion vers downloads.sourceforge.net 
(downloads.sourceforge.net)|216.34.181.59|:80...connect?.
requ?te HTTP transmise, en attente de la r?ponse...404 Not Found
2012-12-07 09:24:35 ERREUR 404: Not Found.

--2012-12-07 09:24:35--  http://192.168.2.17/files/buildroot/cJSONFiles.zip
Connexion vers 192.168.2.17:80...connect?.
requ?te HTTP transmise, en attente de la r?ponse...404 Not Found
2012-12-07 09:24:35 ERREUR 404: Not Found.

make: *** 
[/home/avd/wksp/buildroot/output/build/cjson-undefined/.stamp_downloaded] Erreur 
1
-----------------------

And i know now what is the actual issue. Here the good big fix :

---
  package/cjson/cjson.mk |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ccc6010..55af800 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -5,7 +5,7 @@
  #############################################################
  CJSON_VERSION         = undefined
  CJSON_SOURCE          = cJSONFiles.zip
-CJSON_SITE            = http://downloads.sourceforge.net/project/cjson/
+CJSON_SITE            = http://downloads.sourceforge.net/project/cjson
  CJSON_INSTALL_STAGING = YES
  CJSON_LICENSE         = MIT

-- 
1.7.10.4

Cheers,
avd.
