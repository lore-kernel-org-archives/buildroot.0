From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:16:08 +0200
Subject: [Buildroot] [PATCH] ruby: update to 2.7.1
In-Reply-To: <20200930102319.wj7h72pq7aqcykec@waldemar-brodkorb.de>
References: <20200930102319.wj7h72pq7aqcykec@waldemar-brodkorb.de>
Message-ID: <20200930221608.40d4ab04@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Waldemar,

On Wed, 30 Sep 2020 12:23:19 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> -RUBY_VERSION_MAJOR = 2.4
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).10
> -RUBY_VERSION_EXT = 2.4.0
> +RUBY_VERSION_MAJOR = 2.7
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
> +RUBY_VERSION_EXT = 2.7.0

Thanks a lot for taking care of updating Ruby! Unfortunately, this
breaks the build, at least on SuperH/uClibc:

In file included from coroutine/ucontext/Context.c:14:
coroutine/ucontext/Context.h:22:5: error: unknown type name ?ucontext_t?
     ucontext_t state;
     ^~~~~~~~~~
coroutine/ucontext/Context.h: In function ?coroutine_initialize_main?:
coroutine/ucontext/Context.h:32:5: warning: implicit declaration of function ?getcontext? [-Wimplicit-function-declaration]
     getcontext(&context->state);
     ^~~~~~~~~~
coroutine/ucontext/Context.h: In function ?coroutine_initialize?:
coroutine/ucontext/Context.h:45:19: error: request for member ?uc_stack? in something not a structure or union
     context->state.uc_stack.ss_size = size;
                   ^
In file included from coroutine/ucontext/Context.c:14:
coroutine/ucontext/Context.h:47:19: error: request for member ?uc_stack? in something not a structure or union
     context->state.uc_stack.ss_sp = (char*)stack;
                   ^
coroutine/ucontext/Context.h:48:19: error: request for member ?uc_stack? in something not a structure or union
     context->state.uc_stack.ss_flags = 0;
                   ^
coroutine/ucontext/Context.h:49:19: error: request for member ?uc_link? in something not a structure or union
     context->state.uc_link = NULL;
                   ^
coroutine/ucontext/Context.h:51:5: warning: implicit declaration of function ?makecontext? [-Wimplicit-function-declaration]
     makecontext(&context->state, (void(*)(void))coroutine_trampoline, 2, (void*)start, (void*)context);
     ^~~~~~~~~~~
coroutine/ucontext/Context.h: In function ?coroutine_transfer?:
coroutine/ucontext/Context.h:59:5: warning: implicit declaration of function ?swapcontext? [-Wimplicit-function-declaration]
     swapcontext(&current->state, &target->state);
     ^~~~~~~~~~~
coroutine/ucontext/Context.h: In function ?coroutine_destroy?:
coroutine/ucontext/Context.h:67:19: error: request for member ?uc_stack? in something not a structure or union
     context->state.uc_stack.ss_sp = NULL;
                   ^
coroutine/ucontext/Context.h:68:19: error: request for member ?uc_stack? in something not a structure or union
     context->state.uc_stack.ss_size = 0;
                   ^
make[1]: *** [Makefile:421: coroutine/ucontext/Context.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: Leaving directory '/home/thomas/projets/buildroot/output/build/ruby-2.7.1'

Also, could you review ruby.mk and see if other changes are needed? For
example, when I see:

# workaround for amazing build failure, see
# http://lists.busybox.net/pipermail/buildroot/2014-December/114273.html
define RUBY_REMOVE_VERCONF_H
        rm -f $(@D)/verconf.h
endef
RUBY_POST_CONFIGURE_HOOKS += RUBY_REMOVE_VERCONF_H

It's good to check if that's still needed.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
