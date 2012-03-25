From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 25 Mar 2012 21:12:56 +0200
Subject: [Buildroot] libupnp 1.6.16 ok busybox httpd http headers
	accepted now.
In-Reply-To: <DD8B8FEBBFAF9E488F63FF0F1A69EDD108BA648A@ftrdmel1>
References: <872D2F134ED24DFAA1C92C66435AF2AE@JohanW7>
 <DD8B8FEBBFAF9E488F63FF0F1A69EDD108BA6422@ftrdmel1>
 <6AEA84B4C47843ED897B9FAFA0BC5CF3@JohanW7>
 <DD8B8FEBBFAF9E488F63FF0F1A69EDD108BA648A@ftrdmel1>
Message-ID: <ED7917D7CCD741F0BDC1F5ACC6B31F49@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice 
 
I confirm 1.6.16 is working now, however i discovered that i do get a segmentation fault if  i use uClibc 0.9.33 with the newer
pthread enabled, when using the older style pthreads in uClibc 0.9.33 then its ok.
 
Problem is that i have packages that segfault when using the older pthread style en work ok with the newer one...
Gonna do a build of the old libupnp 1.6.6 to see how it behaves with the new pthread..
 
 Regards 
Johan
  _____  

Van: fabrice.fontaine at orange.com [mailto:fabrice.fontaine at orange.com] 
Verzonden: zondag 25 maart 2012 8:19
Aan: sagaert.johan at skynet.be
CC: marcelo.jimenez at gmail.com
Onderwerp: RE: libupnp



Hi Johan,

 

I think the problem was caused because the response was made over HTTP/1.0 (http://sourceforge.net/tracker/?func=detail
<http://sourceforge.net/tracker/?func=detail&aid=3485745&group_id=166957&atid=841026> &aid=3485745&group_id=166957&atid=841026).

This bug was introduced in the library in 1.6.7 and should be fixed in 1.6.16.

Could you confirm that it is ok with 1.6.16?

 

Best Regards,

 

Fabrice

 

De : Sagaert Johan [mailto:sagaert.johan at skynet.be] 
Envoy? : samedi 24 mars 2012 22:15
? : FONTAINE Fabrice RD-MAPS-REN
Cc : marcelo.jimenez at gmail.com
Objet : RE: libupnp

 

Hi Fabrice

 

This is the header i captured on my host pc  

I  opened my browser at http://192.168.1.104/Upnp/device.xml and used a network sniffer (Microsoft nework monitor 3.4) to capture
the response from the httpd server from busybox.

 

I hope this data is usefull, i did not include the capture of the next frames containing the xml since i included the xml in this
mail.

 

 

  Frame: Number = 1024, Captured Frame Length = 243, MediaType = ETHERNET
+ Ethernet: Etype = Internet IP (IPv4),DestinationAddress:[D4-85-64-09-34-E7],SourceAddress:[20-74-01-00-01-24]
+ Ipv4: Src = 192.168.1.104, Dest = 192.168.1.102, Next Protocol = TCP, Packet ID = 37462, Total IP Length = 229
+ Tcp: Flags=...AP..., SrcPort=HTTP(80), DstPort=29126, PayloadLen=189, Seq=2525044708 - 2525044897, Ack=1071958324, Win=3456 (scale
factor 0x1) = 6912
- Http: Response, HTTP/1.0, Status: Ok, URL: /Upnp/device.xml 
    ProtocolVersion: HTTP/1.0
    StatusCode: 200, Ok
    Reason: OK
  + ContentType:  text/xml
    Date:  Fri, 02 Jan 1970 11:41:19 GMT
    Connection:  close
    Accept-Ranges:  bytes
    Last-Modified:  Mon, 16 Jan 2012 15:16:54 GMT
    ContentLength:  2106
    HeaderEnd: CRLF

 

//this is the response in hex and in ascii

 

48 54 54 50 2F 31 2E 30 20 32 30 30 20 4F 4B 0D 0A 43 6F 6E 74 65 6E 74 2D 74 79 70 65 3A 20 74 65 78 74 2F 78 6D 6C 0D 0A 44 61 74
65 3A 20 46 72 69 2C 20 30 32 20 4A 61 6E 20 31 39 37 30 20 31 31 3A 34 31 3A 31 39 20 47 4D 54 0D 0A 43 6F 6E 6E 65 63 74 69 6F 6E
3A 20 63 6C 6F 73 65 0D 0A 41 63 63 65 70 74 2D 52 61 6E 67 65 73 3A 20 62 79 74 65 73 0D 0A 4C 61 73 74 2D 4D 6F 64 69 66 69 65 64
3A 20 4D 6F 6E 2C 20 31 36 20 4A 61 6E 20 32 30 31 32 20 31 35 3A 31 36 3A 35 34 20 47 4D 54 0D 0A 43 6F 6E 74 65 6E 74 2D 6C 65 6E
67 74 68 3A 20 32 31 30 36 0D 0A 0D 0A 
HTTP/1.0 200 OK..Content-type: text/xml..Date: Fri, 02 Jan 1970 11:41:19 GMT..Connection: close..Accept-Ranges:
bytes..Last-Modified: Mon, 16 Jan 2012 15:16:54 GMT..Content-length: 2106....

 


Kind regards 

Sagaert Johan

 

 

  _____  

Van: fabrice.fontaine at orange.com [mailto:fabrice.fontaine at orange.com] 
Verzonden: zaterdag 24 maart 2012 21:23
Aan: sagaert.johan at skynet.be
CC: marcelo.jimenez at gmail.com
Onderwerp: RE: libupnp

Hi Johan,

 

The latest version of pupnp is now the 1.6.16.

Could you put the content of the device.xml file as well as the HTTP response containing the headers which seem to cause a parsing
problem?

The difference between the 1.6.x and the 1.8.x is that the 1.8.x introduces a new API which removes access to the library internal
structures.

However, from my understanding, this API was not officially published yet.

 

Best Regards,

 

Fabrice

 

De : Sagaert Johan [mailto:sagaert.johan at skynet.be] 
Envoy? : vendredi 23 mars 2012 18:07
? : FONTAINE Fabrice RD-MAPS-REN
Objet : libupnp

 

Hi

 

I was using the old 1.6.6 version and now i upgraded to use one of the latest 1.6.14.

 

I am using it in combination with the httpd from busybox.

 

But the 1.6.14 gives me an error, i am using an url as the descriptor :

 

http://192.168.1.104/Upnp/device.xml <http://192.168.1.104/Upnp/device.xml> 

 

The file is there but ,i get an error when calling UpnpRegisterRootDevice.

UpnpRegisterRootDevice  failed with code: -119 .

I did some searching at it seems the parser yields an error PARSER_ERROR

 

It looks like the parser does'nt like the header sent from the httpd (busybox 1.19.4) server.

 

I do not get the error when going back to 1.6.6, or use the sources from debian 1.8.x

 

I am using buildroot to create a rootfs and toolchain for my target (ARM9 )

 

Question what is different comparing this version branch with the one used in debian (1.8.x version ) 

 

 <http://packages.debian.org/squeeze/libupnp4> http://packages.debian.org/squeeze/libupnp4

 <http://ftp.de.debian.org/debian/pool/main/libu/libupnp4/libupnp4_1.8.0~svn20100507.orig.tar.gz>
http://ftp.de.debian.org/debian/pool/main/libu/libupnp4/libupnp4_1.8.0~svn20100507.orig.tar.gz

Regards ,Johan

 

 

 

 

 

 

 

 

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120325/a4b5b8c3/attachment-0001.html>
