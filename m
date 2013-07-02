From: Graham Newton <gnewton@peavey-eu.com>
Date: Tue, 02 Jul 2013 13:18:04 +0100
Subject: [Buildroot] Shutting down a websocket
Message-ID: <51D2C4FC.7040307@peavey-eu.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a websocket application that communicates with another server via 
a standard socket.  What I would like to do is shutdown the websocket 
cleanly in the event of the standard socket shutting down.
At present if I detect the standard socket shutting down I flag the 
event and call libwebsocket_callback_on_writable.  At the start of the 
processing of LWS_CALLBACK_SERVER_WRITEABLE I test the flag and return 
-1 to shutdown the websocket like so:
     case LWS_CALLBACK_SERVER_WRITEABLE:
         {

             if( pss->shutdown  ){  // pss is a pointer to websocket 
specific user data
                 return -1;         // Shutdown websocket
             }
             ...
However this appears to causes problems in that later I get an assert in 
insert_wsi_socket_into_fds at assert(wsi->sock); which appears to 
suggest that the socket has been shutdown but the websocket object is 
still being serviced.
Am I shutting down the websocket in the correct manner?
Thanks
Graham

-- 
Graham Newton
Senior Software Engineer
------------------------------------------------------------------------
Peavey Digital Research
A Division of Peavey Electronics Corporation


Phone 	+44 1865 734397
Direct 	+44 1865 734397
Email 	gnewton at peavey-eu.com
Web 	www.peaveycommercialaudio.com 
<http://www.peaveycommercialaudio.com> - mm.peavey.com 
<http://mm.peavey.com> - www.crestaudio.com <http://www.crestaudio.com> 
- aa.peavey.com <http://aa.peavey.com> - www.peaveyoxford.com 
<http://www.peaveyoxford.com>


*PEAVEY COMMERCIAL AUDIO* - Great Folds Road, Corby, Northamptonshire, 
NN18 9ET UK
*PEAVEY DIGITAL RESEARCH* - 6 Elm Place, Eynsham, Oxfordshire OX29 4BD UK
*PEAVEY ITALIA* - Via P.La Torre 21, Zona Ind.le Cerretano, 60022 
Castelfidardo An, Italy
*PEAVEY CHINA* - 1F Taiping Yaoye, 3 Gongye Wu Lu, Shekou, Shenzhen 
China 518067
*PEAVEY ELECTRONICS CORPORATION* - 5022 Hartley Peavey Drive, Meridian, 
MS 39305 USA


Peavey Electronics Limited is a registered company in England & Wales, 
Company Registration No.: 01249126
Registered office: GREAT FOLDS ROAD OAKLEY HAY CORBY NORTHAMPTONSHIRE. 
NN18 9ET

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130702/55fbe0d9/attachment.html>
