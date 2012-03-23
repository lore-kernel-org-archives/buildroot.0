From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 23 Mar 2012 18:33:28 +0100
Subject: [Buildroot] libupnp version 1.6.14 Not OK : httpd (busybox)
	http header not accepted by libupnp 1.6.14 ?
In-Reply-To: <0180fc4aa250d447b1da60b4cecb5d88@zacarias.com.ar>
References: <20120321130510.D12F095418@busybox.osuosl.org>
 <A6EF940D27964F9AA5B3B3B810E12908@JohanW7>
 <9b5ef20685570e5b23f65a27d03a9afb@zacarias.com.ar>
 <3A0E0C9320F449BC8EB3C0BC9A1CEF40@JohanW7>
 <6cbdb6e08635a9c3e9b273a7a95a2a56@zacarias.com.ar>
 <36443DEF86594D9B9A729F56B7FA7973@JohanW7>
 <0180fc4aa250d447b1da60b4cecb5d88@zacarias.com.ar>
Message-ID: <CE13F41522F543FF9EEA63F4B397A7BB@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Gustavo


>Hi Johan.
>Just tested 1.6.16 and it's not playing too well with ushare either.
>can you send your package for Debian's 1.8.x so i can test it?
>I'd rather avoid a fork (which it probably is) but it seems original upstream isn't working that great even though it's still
>>doing new releases.
>Regards.

I have sent them to you as attachements, did you get them ?


I did some experiments, i moved the xml descriptor files to an external http server (microsoft iis )
With the files served from IIS upnp1.6.14 seems to work, so this confirms that the http header sent by busybox is rejected by
libupnp1.6.14

Its clear that busybox does not add the correct content header when requesting an xml file from the server.
Some network sniffing results :

(Should this be forwarded to the busybox maintainers ? I don't like to subscribe to yet another list ...)

//this is the http request from libupnp to my IIS server

  Frame: Number = 76, Captured Frame Length = 263, MediaType = ETHERNET
+ Ethernet: Etype = Internet IP (IPv4),DestinationAddress:[D4-85-64-09-34-E7],SourceAddress:[20-74-01-00-01-24]
+ Ipv4: Src = 192.168.1.104, Dest = 192.168.1.102, Next Protocol = TCP, Packet ID = 9360, Total IP Length = 249
+ Tcp: Flags=...AP..., SrcPort=49974, DstPort=HTTP(80), PayloadLen=197, Seq=894946028 - 894946225, Ack=3193555768, Win=2920 (scale
factor 0x1) = 5840
- Http: Request, GET /Upnp/device.xml 
    Command: GET
  + URI: /Upnp/device.xml
    ProtocolVersion: HTTP/1.1
    Host:  192.168.1.102
    DATE:  Thu, 01 Jan 1970 08:04:50 GMT
    Connection:  close
    UserAgent:  Linux/2.6.36.1Apexsystems, UPnP/1.0, Portable SDK for UPnP devices/1.6.14
    HeaderEnd: CRLF



//IIS response

  Frame: Number = 64, Captured Frame Length = 2437, MediaType = ETHERNET
+ Ethernet: Etype = Internet IP (IPv4),DestinationAddress:[20-74-01-00-01-24],SourceAddress:[D4-85-64-09-34-E7]
+ Ipv4: Src = 192.168.1.102, Dest = 192.168.1.104, Next Protocol = TCP, Packet ID = 27873, Total IP Length = 2423
+ Tcp: Flags=...AP..F, SrcPort=HTTP(80), DstPort=54797, PayloadLen=2371, Seq=1781580870 - 1781583242, Ack=2048970879, Win=260 (scale
factor 0x8) = 66560
- Http: Response, HTTP/1.1, Status: Ok, URL: /Upnp/device.xml 
    ProtocolVersion: HTTP/1.1
    StatusCode: 200, Ok
    Reason: OK
  + ContentType:  text/xml
    Last-Modified:  Mon, 16 Jan 2012 15:16:54 GMT
    Accept-Ranges:  bytes
    ETag:  "0f713e161d4cc1:0"
    Server:  Microsoft-IIS/7.5
    XPoweredBy:  ASP.NET
    Date:  Fri, 23 Mar 2012 17:03:43 GMT
    Connection:  close
    ContentLength:  2106
    HeaderEnd: CRLF
  - payload: HttpContentType =  text/xml
   - Xml: version="1.0"
      XmlPropertiesInitiator: 
    + XMLDecl: XmlElement:<{xml directive}>
    + Element: XmlElement:<root>



//request using my IE browser 
  Frame: Number = 252, Captured Frame Length = 619, MediaType = ETHERNET
+ Ethernet: Etype = Internet IP (IPv4),DestinationAddress:[20-74-01-00-01-24],SourceAddress:[D4-85-64-09-34-E7]
+ Ipv4: Src = 192.168.1.102, Dest = 192.168.1.104, Next Protocol = TCP, Packet ID = 28654, Total IP Length = 605
+ Tcp: Flags=...AP..., SrcPort=2405, DstPort=HTTP(80), PayloadLen=565, Seq=3687406579 - 3687407144, Ack=3178967085, Win=16425 (scale
factor 0x2) = 65700
- Http: Request, GET /Upnp/device.xml 
    Command: GET
  + URI: /Upnp/device.xml
    ProtocolVersion: HTTP/1.1
    Accept:  application/x-ms-application, image/jpeg, application/xaml+xml, image/gif, image/pjpeg, application/x-ms-xbap, */*
    Accept-Language:  nl-BE
    UserAgent:  Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; Win64; x64; Trident/4.0; .NET CLR 2.0.50727; SLCC2; .NET CLR
3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; Tablet PC 2.0)
    UA-CPU:  AMD64
    Accept-Encoding:  gzip, deflate
    If-Modified-Since:  Thu, 22 Mar 2012 15:49:18 GMT; length=2106
    Host:  192.168.1.104
    Connection:  Keep-Alive
  + Cookie:  ui_language=en_US
    HeaderEnd: CRLF


//response (header only) from httpd busybox

  Frame: Number = 316, Captured Frame Length = 259, MediaType = ETHERNET
+ Ethernet: Etype = Internet IP (IPv4),DestinationAddress:[D4-85-64-09-34-E7],SourceAddress:[20-74-01-00-01-24]
+ Ipv4: Src = 192.168.1.104, Dest = 192.168.1.102, Next Protocol = TCP, Packet ID = 5937, Total IP Length = 245
+ Tcp: Flags=...AP..., SrcPort=HTTP(80), DstPort=2405, PayloadLen=205, Seq=3178967085 - 3178967290, Ack=3687407144, Win=3485 (scale
factor 0x1) = 6970
- Http: Response, HTTP/1.0, Status: Ok, URL: /Upnp/device.xml 
    ProtocolVersion: HTTP/1.0
    StatusCode: 200, Ok
    Reason: OK
  + ContentType:  application/octet-stream
    Date:  Thu, 01 Jan 1970 08:07:16 GMT
    Connection:  close
    Accept-Ranges:  bytes
    Last-Modified:  Mon, 16 Jan 2012 15:16:54 GMT
    ContentLength:  2106
    HeaderEnd: CRLF
    
    
  //request with firefox
    Frame: Number = 31, Captured Frame Length = 365, MediaType = ETHERNET
+ Ethernet: Etype = Internet IP (IPv4),DestinationAddress:[20-74-01-00-01-24],SourceAddress:[D4-85-64-09-34-E7]
+ Ipv4: Src = 192.168.1.102, Dest = 192.168.1.104, Next Protocol = TCP, Packet ID = 29443, Total IP Length = 351
+ Tcp: Flags=...AP..., SrcPort=2425, DstPort=HTTP(80), PayloadLen=311, Seq=3322553960 - 3322554271, Ack=2603988782, Win=16425 (scale
factor 0x2) = 65700
- Http: Request, GET /Upnp/device.xml 
    Command: GET
  + URI: /Upnp/device.xml
    ProtocolVersion: HTTP/1.1
    Host:  192.168.1.104
    UserAgent:  Mozilla/5.0 (Windows NT 6.1; WOW64; rv:11.0) Gecko/20100101 Firefox/11.0
    Accept:  text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
    Accept-Language:  nl,en-us;q=0.7,en;q=0.3
    Accept-Encoding:  gzip, deflate
    Connection:  keep-alive
    HeaderEnd: CRLF


//response (header only) from busybox httpd
  Frame: Number = 91, Captured Frame Length = 259, MediaType = ETHERNET
+ Ethernet: Etype = Internet IP (IPv4),DestinationAddress:[D4-85-64-09-34-E7],SourceAddress:[20-74-01-00-01-24]
+ Ipv4: Src = 192.168.1.104, Dest = 192.168.1.102, Next Protocol = TCP, Packet ID = 13446, Total IP Length = 245
+ Tcp: Flags=...AP..., SrcPort=HTTP(80), DstPort=2425, PayloadLen=205, Seq=2603988782 - 2603988987, Ack=3322554271, Win=3456 (scale
factor 0x1) = 6912
- Http: Response, HTTP/1.0, Status: Ok, URL: /Upnp/device.xml 
    ProtocolVersion: HTTP/1.0
    StatusCode: 200, Ok
    Reason: OK
  + ContentType:  application/octet-stream
    Date:  Thu, 01 Jan 1970 08:11:12 GMT
    Connection:  close
    Accept-Ranges:  bytes
    Last-Modified:  Mon, 16 Jan 2012 15:16:54 GMT
    ContentLength:  2106
    HeaderEnd: CRLF
