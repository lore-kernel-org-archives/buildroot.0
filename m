From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 09:40:21 +0200
Subject: [Buildroot] [PATCH 05/10] gitlab-ci: handle the run-time tests
 conditions in script
In-Reply-To: <1e9ae0cc-604c-d8ae-8501-d3416ac9612c@gmail.com>
References: <cover.1599423132.git.yann.morin.1998@free.fr>
 <85feac31927121c21fb135ec3c40b7897eed20d5.1599423132.git.yann.morin.1998@free.fr>
 <1e9ae0cc-604c-d8ae-8501-d3416ac9612c@gmail.com>
Message-ID: <20200909074021.GP14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-09-08 23:14 +0200, Romain Naour spake thusly:
> Le 06/09/2020 ? 22:12, Yann E. MORIN a ?crit?:
> > Note that we do not propagate the existing comment, because it is
> > partially wrong; instead we just keep the per-condition comments.
> > 
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: Romain Naour <romain.naour@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
[--SNIP--]
> > diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
> > index 23db376944..525ea8ccab 100755
> > --- a/support/scripts/generate-gitlab-ci-yml
> > +++ b/support/scripts/generate-gitlab-ci-yml
> > @@ -8,10 +8,7 @@ main() {
> >      preamble "${template}"
> >  
> >      gen_defconfigs
> > -
> > -    ./support/testing/run-tests -l 2>&1 \
> > -    | sed -r -e '/^test_run \((.*)\).*/!d; s//\1: { extends: .runtime_test }/' \
> > -    | LC_ALL=C sort
> > +    gen_tests
> >  }
> >  
> >  preamble() {
> > @@ -55,4 +52,32 @@ gen_defconfigs() {
> >      done
> >  }
> >  
> > +gen_tests() {
> > +    local -a tests
> > +    local run_tests tst
> > +
> > +    tests=( $(./support/testing/run-tests -l 2>&1 \
> > +              |sed -r -e '/^test_run \((.*)\).*/!d; s//\1/'\
> > +              |LC_ALL=C sort)
> 
> Maybe we should keep the space after the pipe | ?

I've fixed that when applying, thanks.

Regards,
Yann E. MORIN.

> Reviewed-by: Romain Naour <romain.naour@gmail.com>
> 
> Best regards,
> Romain
> 
> 
> > +          )
> > +
> > +    run_tests=false
> > +    if [ -n "${CI_COMMIT_TAG}" ]; then
> > +        # For tags, create a pipeline.
> > +        run_tests=true
> > +    fi
> > +    if [ -n "${CI_PIPELINE_TRIGGERED}" ]; then
> > +        # For pipeline created by using a trigger token.
> > +        run_tests=true
> > +    fi
> > +    case "${CI_COMMIT_REF_NAME}" in
> > +        # For the branch or tag name named *-runtime-tests, create a pipeline.
> > +        (*-runtime-tests) run_tests=true;;
> > +    esac
> > +
> > +    if ${run_tests}; then
> > +        printf '%s: { extends: .runtime_test }\n' "${tests[@]}"
> > +    fi
> > +}
> > +
> >  main "${@}"
> > 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
