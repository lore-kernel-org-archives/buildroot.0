From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 08 Feb 2017 11:07:07 +0100
Subject: [Buildroot] [PATCH v5 01/19] reproducible: fix DATE/TIME macros
	in toolchain-wrapper
In-Reply-To: <87k291rawq.fsf@dell.be.48ers.dk>
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-2-git-send-email-jezz@sysmic.org>
 <87k291rawq.fsf@dell.be.48ers.dk>
Message-ID: <2610985.18vsFpMzc5@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tuesday 07 February 2017 21:41:41 Peter Korsgaard wrote:
[...]
> > +{
>  > +	char *source_date_epoch;
>  > +	long long epoch;
>  > +	char *endptr;
>  > +
>  > +	source_date_epoch = getenv("SOURCE_DATE_EPOCH");
>  > +	if (!source_date_epoch)
>  > +		return (time_t) -1;
>  > +
>  > +	errno = 0;
>  > +	epoch = strtoll (source_date_epoch, &endptr, 10);
> 
> NIT: No space between strtoll and '('.
> 
> > +	if ((errno == ERANGE && (epoch == LLONG_MAX || epoch == LLONG_MIN))
>  > +			|| (errno != 0 && epoch == 0)) {
>  > +		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
>  > +				"strtoll: %s\n", strerror(errno));
>  > +		exit(2);
>  > +	}
>  > +	if (endptr == source_date_epoch) {
>  > +		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
>  > +				"no digits were found: %s\n", endptr);
>  > +		exit(2);
>  > +	}
>  > +	if (*endptr != '\0') {
>  > +		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
>  > +				"trailing garbage: %s\n", endptr);
>  > +		exit(2);
>  > +	}
>  > +	if (epoch < 0) {
>  > +		fprintf(stderr, "environment variable $SOURCE_DATE_EPOCH: "
>  > +				"value must be nonnegative: %lld \n", epoch);
>  > +		exit(2);
>  > +	}
> 
> I'm not sure this detailed error handling is really needed, but OK.

In fact I copy-paste get_source_date_epoch() from gcc git. So toolchain
wrapper will produce exactly same error messages than upstream gcc
(and it include same coding style error :-) ).



-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
