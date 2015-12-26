From: Geoffrey Ragot <geoffreyragot@gmail.com>
Date: Sat, 26 Dec 2015 13:14:31 +0100
Subject: [Buildroot] Nginx package
In-Reply-To: <20151226105836.26a19543@free-electrons.com>
References: <567E5D9E.1030003@gmail.com>
 <20151226105836.26a19543@free-electrons.com>
Message-ID: <567E84A7.70302@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello,

the pb is that luajit (in the context) is not a builtin module of nginx.
It has to be built in a directory and nginx has to be compiled with 
"--add-module <path_to_luajit>".

The nginx package has an option to specify "--add-module" arguments but 
in this case, the dependency is not clearly mentionned in nginx.mk.
I have to care about build luajit before nginx to ensure that 
<path_to_luajit> contains required files.


On 12/26/2015 10:58 AM, Thomas Petazzoni wrote:
> Hello,
>
> On Sat, 26 Dec 2015 10:27:58 +0100, Geoffrey Ragot wrote:
>
>> I have a question related to packages dependencies.
>>
>> I have a case where i want to compile nginx with some additionnal
>> modules (luajit).
>> I can define modules paths in the nginx config, but i don't find a way
>> to say buildroot to compile these additional modules before nginx,
>> otherwise than modifying nginx dependencies.
> Well, look at nginx.mk, there are plenty of examples:
>
> ifeq ($(BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE),y)
> NGINX_DEPENDENCIES += zlib
> NGINX_CONF_OPTS += --with-http_spdy_module
> endif
>
> If BR2_PACKAGE_NGINX_HTTP_SPDY_MODULE is enabled, then zlib is
> guaranteed to be built before nginx, and the option
> --with-http_spdy_module will be passed to the nginx configure script.
>
> Best regards,
>
> Thomas
