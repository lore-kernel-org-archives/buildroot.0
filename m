From: giacomo.pd at virgilio.it <giacomo.pd@virgilio.it>
Date: Sun, 28 Sep 2014 17:48:20 +0200 (CEST)
Subject: [Buildroot] Beaglebone white lighttpd and cgi binary - error
 message: (mod_cgi.c.1312) cleaning up CGI: process died with signal 6
Message-ID: <148bcf2c919.giacomo.pd@virgilio.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

  
Hi,


	
I have a Beaglebone white and I have downloaded the Sitara OS from 
TI site. I have configured the lighttpd present in the Sitara for to 
show my Start.html page. In the start page I have a button that call a 
cgi program. The cgi is a cpp project that show the Hello world! string.
 I have cross compiled the cgi. All is ok, the lighttpd web server show 
my Start page and the cgi run ok. The button show the Hello world! 
string in the browser.


	
I have configured Buildroot for to made my personal linux 
distribution for my Beaglebone white. In the configuration I have added 
lighttpd with SSL, Perl with pcre and PHP.


	
Then I have moved the Start.html page and the Hello world cgi object file in the new os built with Buildroot.


	
The Start page is ok but the cgi show a blank page!


	
In the lighttpd-error.log file there is the following string:
"(mod_cgi.c.1312) cleaning up CGI: process died with signal 6"


	
In the following lines there are the version of the lighttpd in the Sitara OS:


	
root at am335x-evm:~# lighttpd -V                              
lighttpd/1.4.32 - a light and fast webserver                                            
Build-Date: Mar  4 2014 12:27:52


	
Event Handlers:               


	+ select (generic)                          
        + poll (Unix)                     
        - rt-signals (Linux 2.4+)                                 
        + epoll (Linux 2.6)                           
        - /dev/poll (Solaris)                             
        - eventports (Solaris)                              
        - kqueue (FreeBSD)                          
        - libev (generic)


	
Network handler:                


	- linux-sendfile                        
        - freebsd-sendfile
        - solaris-sendfilev
        + writev
        + write
        - mmap support


	
Features:


	+ IPv6 support
        + zlib support
        - bzip2 support
        + crypt support
        - SSL Support
        + PCRE support
        - mySQL support
        - LDAP support
        - memcached support
        - FAM support
        - LUA support
        - xml support
        - SQLite support
        - GDBM support


	
root at am335x-evm:~#


	
These are the version of the languages installed in the Sitara OS:


	
perl - 5.14.3-r1
php - 5.4.14-r4.0-arago2
php-cgi - 5.4.14-r4.0-arago2
php-cli - 5.4.14-r4.0-arago2


	
Here there are the version of the lighttpd installed by Buildroot in my
personal OS:


	lighttpd -V             
lighttpd/1.4.35 (ssl) - a light and fast webserver                                                  
Build-Date: Sep  7 2014 07:21:51


	
Event Handlers:               


	+ select (generic)                          
        + poll (Unix)                     
        - rt-signals (Linux 2.4+)                                 
        + epoll (Linux 2.6)                           
        - /dev/poll (Solaris)                             
        - eventports (Solaris)                              
        - kqueue (FreeBSD)                          
        - libev (generic)


	
Network handler:                


	- linux-sendfile                        
        - freebsd-sendfile
        - solaris-sendfilev
        + writev
        + write
        - mmap support


	
Features:


	- IPv6 support
        + zlib support
        + bzip2 support
        + crypt support
        + SSL Support
        + PCRE support
        - mySQL support
        - LDAP support
        - memcached support
        - FAM support
        - LUA support
        - xml support
        - SQLite support
        - GDBM support


	
#


	
These are the version of the languages installed by Buildroot:


	
pcre-8.35.tar.gz
perl-5.18.2.tar.bz2
perl-5.18.2-cross-0.8.5.tar.gz
php-5.5.16.tar.gz


	
This is the configuration used in the .conf file:


	
cgi.assign                 = ( ".php"  => "/lighttpd/sbin/php",
                               ".cgi" => "/usr/bin/perl",
                               ".rb"  => "/usr/bin/ruby",
                               ".erb" => "/usr/bin/eruby",
                               ".py"  => "/usr/bin/python" )


	
I have tested also the old version, but without results:


	
alias.url += ( "/cgi-bin" => server_root + "/cgi-bin" )
$HTTP["url"] =~ "^/cgi-bin" {
   cgi.assign = ( "" => "" )
}


	
This the cpp project compiled and renamed as test.cgi:


	
#include <iostream>
using namespace std;


	
int main ()
{


	cout << "Content-type:text/html\r\n\r\n";
   cout << "&amp;lt;html&amp;gt;\n";
   cout << "&amp;lt;head&amp;gt;\n";
   cout << "&amp;lt;title&amp;gt;Hello World - First CGI Program&amp;lt;/title&amp;gt;\n";
   cout << "&amp;lt;/head&amp;gt;\n";
   cout << "&amp;lt;body&amp;gt;\n";
   cout << "&amp;lt;h2&amp;gt;Hello World! This is my first CGI program&amp;lt;/h2&amp;gt;\n";
   cout << "&amp;lt;/body&amp;gt;\n";
   cout << "&amp;lt;/html&amp;gt;\n";


	return 0;
}


	
Could help me about this error?
Perl with pcre is all I need for run the C++ cgi program?
It is necessary to add something else to the buildroot package for run cgi program in C++?


	
Many thanks in advance
  
   
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140928/2cf322b8/attachment-0001.html>
