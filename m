From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Thu, 05 Feb 2009 10:18:49 -0800
Subject: [Buildroot] Web Server
In-Reply-To: <878woldc0r.fsf@macbook.be.48ers.dk>
References: <498A1FA9.1070306@ethertek.ca> <878woldc0r.fsf@macbook.be.48ers.dk>
Message-ID: <498B2D89.2080700@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello List:

I have got a little further with making Cherokee work with Buildroot. 
Using Peter's suggestion of   export ac_cv_func_malloc_0_nonnull=yes   
solved the error  undefined reference to `rpl_malloc' .

The cherokee.mk file now looks like this
#############################################################
# cherokee
#############################################################
CHEROKEE_VERSION = 0.98.1
CHEROKEE_SOURCE = cherokee-$(CHEROKEE_VERSION).tar.gz
CHEROKEE_SITE = http://www.cherokee-project.com/download/0.98/0.98.1
CHEROKEE_AUTORECONF = NO
CHEROKEE_INSTALL_STAGING = YES
CHEROKEE_INSTALL_TARGET = YES

CHEROKEE_CONF_OPT = export ac_cv_func_malloc_0_nonnull=yes

CHEROKEE_DEPENDENCIES = uclibc

$(eval $(call AUTOTARGETS,package,cherokee))


I am now getting a different error;   unrecognized command line option 
"-m32"
Can anyone suggest a work around for this error?

Best Regards,
Dan Pattison





Hello Peter:

Thanks for your reply. I think the stock BOA does not support Basic HTTP 
auth, see:  http://en.wikipedia.org/wiki/Boa_(web_server)
Please correct me if I am wrong. I cannot find where to set the password 
file in boa.conf. The docs for the boa conf file do not mention how to 
set the password.

I've googled around and there are some patches against boa 0.94 
mentioned that add basic auth functionality. Axis Communications (ARCH 
cris - Etrax) have added this to boa in their linux SDK.

I will check out the busybox httpd to see if it supports it, and will 
have a look at lighttpd.

I would still like to get Cherokee running if possible. Any chance 
someone more knowledgeable than me can download it and figure out to 
make it compile for buildroot? http://www.cherokee-project.com/

Thanks,
Dan Pattison

Peter Korsgaard wrote:
>>>>>> "Dan" == Dan Pattison <dan.pattison@ethertek.ca> writes:
>>>>>>             
>
>  Dan> Hello List:
>  Dan> We are using buildroot v2009.02 on a Fedora 10 linux distro. Our
>  Dan> architecture is for Atmel AT91SAM9G20-EK development board. We want a
>  Dan> more robust web server than the BOA or Busybox HTTPD. Our main
>  Dan> requirement is to have the web server make a web browser (IE6, IE7,
>  Dan> Firefox etc.) display a login/password box. It seems the two mentioned
>  Dan> web servers do not support this.
>
> Standard http auth? Both busybox httpd and boa supports that.
>
>  Dan> Apache seems overkill for our needs, so we wanted to try
>  Dan> Cherokee-0.98.1:  http://www.cherokee-project.com/
>
> We also have lighttpd in busybox, maybe take a look at that.
>
>  Dan> Using /buildroot/scripts/add_new_package.wizard we are able to make
>  Dan> our package show up in the make menuconfig configurator utility. When
>  Dan> we do a make from the top level directory we can see Cherokee gets
>  Dan> downloaded and starts to compile, but it errors out with these errors
>  Dan> below:
>
>  Dan> spawn-fcgi.o: In function `fcgi_spawn_connection':                                                                           
>
>  Dan> spawn-fcgi.c:(.text+0x340): undefined reference to `rpl_malloc'
>  Dan> collect2: ld returned 1 exit status                                                                                          
>
> Check config.log, you normally have to set a *_cv_func_malloc_* (don't
> remember the exact name offhand) variable to not get it to use this
> malloc wrapper.
>
>   
> ------------------------------------------------------------------------
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com 
> Version: 8.0.233 / Virus Database: 270.10.17/1934 - Release Date: 01/29/09 17:57:00
>
>   
